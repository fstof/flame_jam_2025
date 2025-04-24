import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class Launchpad extends BodyComponent {
  static final Vector2 size = Vector2(4, 6);
  final Vector2 _position;

  Launchpad(Vector2 position) : _position = position + Vector2(0, 1);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    final sprite = await game.loadSprite('Launchpad.png');
    renderBody = false;

    add(
      SpriteComponent(
        sprite: sprite,
        size: size * 1.5,
        anchor: Anchor.center,
        position: Vector2(-size.x * 0.1, -size.y * 0.25),
      ),
    );
  }

  @override
  Body createBody() {
    final shape = PolygonShape();

    final verticies = [
      Vector2(-size.x * 0.7, -size.y * 0.95),
      Vector2(-size.x * 0.7, size.y * 0.5),
      Vector2(-size.x * 0.5, size.y * 0.5),
      Vector2(-size.x * 0.5, -size.y * 0.95),
    ];

    shape.set(verticies);

    final fixtureDef = FixtureDef(
      shape,
      friction: 1.0,
    );
    final bodyDef = BodyDef(
      userData: this,
      position: _position,
    );

    body = world.createBody(bodyDef)..createFixture(fixtureDef);

    final verticies2 = [
      Vector2(-size.x * 0.6, size.y * 0.4),
      Vector2(-size.x * 0.6, size.y * 0.5),
      Vector2(size.x * 0.5, size.y * 0.5),
      Vector2(size.x * 0.5, size.y * 0.4),
    ];

    shape.set(verticies2);
    body.createFixture(fixtureDef);

    return body;
  }
}
