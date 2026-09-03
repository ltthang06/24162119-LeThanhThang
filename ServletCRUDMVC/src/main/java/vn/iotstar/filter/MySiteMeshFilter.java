package vn.iotstar.filter;

import jakarta.servlet.annotation.WebFilter;
import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

@WebFilter("/*")
public class MySiteMeshFilter extends ConfigurableSiteMeshFilter {

    @Override
    protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
        builder.addDecoratorPath("/admin/*", "/admin.jsp") 
               .addDecoratorPath("/*", "/web.jsp")
               .addExcludedPath("/login")
               .addExcludedPath("/register")
               .addExcludedPath("/uploads/*");
    }
}