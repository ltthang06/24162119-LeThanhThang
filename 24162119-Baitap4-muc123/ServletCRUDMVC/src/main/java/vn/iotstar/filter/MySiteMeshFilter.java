package vn.iotstar.filter;

import jakarta.servlet.annotation.WebFilter;
import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

@WebFilter("/*")
public class MySiteMeshFilter extends ConfigurableSiteMeshFilter {

    @Override
    protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
        builder.addDecoratorPath("/admin/*", "/admin.jsp");
        builder.addDecoratorPath("/*", "/web.jsp");

        builder.addExcludedPath("/login");
        builder.addExcludedPath("/register");
        builder.addExcludedPath("/forgot-password");
        builder.addExcludedPath("/reset-password");
        builder.addExcludedPath("/verify-code");
        builder.addExcludedPath("/verify");
        builder.addExcludedPath("/waiting");

        builder.addExcludedPath("/image*");
        builder.addExcludedPath("/uploads/*");
        builder.addExcludedPath("/static/*");
        builder.addExcludedPath("/assets/*");
    }
}