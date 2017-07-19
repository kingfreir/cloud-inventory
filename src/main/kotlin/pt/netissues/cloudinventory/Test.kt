package pt.netissues.cloudinventory

import io.vertx.core.AbstractVerticle
import io.vertx.core.Future

class Test : AbstractVerticle() {

    override fun start(fut: Future<Void>) {
        vertx
            .createHttpServer()
            .requestHandler { r -> r.response().end("<h1>Hello from my first Vert.x 3 application</h1>") }
            .listen(8080) { result ->
                if (result.succeeded()) {
                    fut.complete()
                } else {
                    fut.fail(result.cause())
                }
            }
    }
}
