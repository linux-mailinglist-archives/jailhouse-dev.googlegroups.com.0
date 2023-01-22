Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHU5W2PAMGQEVLORMHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA056771E5
	for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 20:29:36 +0100 (CET)
Received: by mail-lf1-x13c.google.com with SMTP id i13-20020a056512340d00b004b8825890a1sf4050304lfr.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 11:29:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1674415775; cv=pass;
        d=google.com; s=arc-20160816;
        b=fhx4WywzPNT2WRq6UXD3idRNPyQyuW7hdSwDgVBVBG7WE03rcRtQmOJNAVknlulVDm
         sRKOuxOBefqWv32UAHoC5NIMUR1b1gm1bv8AjOw+XPObDgxctDNvtaGBf+7Pgm8kE+xg
         D3U/10SdtALXdOYVWlbEXC1U+AIE6O00WoWtKZxjrsbVfeIy+/PzBGEeGcdJwSTq3aSj
         rztfOqT8z2hSkV40UgBIeBp2xgXF1iz/UojJIBR9V+UaK0Sb93KTJuXCoKdkzLiDenMv
         roI4Q4Y9z8jdq4cyUEterkcoVSLKoU17ospXl7BN2r4n6f+I587AhWz1bEGajHl+5H0/
         2a4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:feedback-id:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:sender:dkim-signature;
        bh=KJBpCqgmkOP4INxMLxRRfi+HQywRgcgDHJaeKxl4vSQ=;
        b=DASdOj2uvJtKwxOzsZqQczY1QrMlqwv7OkwWyq55qzT4Z7r/Buedn1yv91GRoe2BH7
         TCSx+r2DCEJpnADIvZwOn//HYfEOcKO1WKG4aw/gUkjMGpC2u1DvClPvSZcSoPtktQIH
         F0Cc1Fr29Umanw+oHmBFDifP6LDwEtTi0EeJ50xyfSqguIV4N+W0kWNvWoPyfB3HUav8
         zfwaku2UlFQeB9X1rxyRPe+9ift7DdpaoPYtRhSfIeXBtVTAmMq5Sr5uO7ovC9PtxqID
         wwciKr6TkoPJ2UfJ3Uz9ZqCdDFCVcBjuPfUBUBeN1Eq4Tk31GyvV5Ur7M8YMW3QE4kYn
         j0xg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=ddWQLcQ+;
       spf=pass (google.com: domain of fm-294854-20230122192902e1df002ee6af011c92-ncyvtt@rts-flowmailer.siemens.com designates 185.136.64.228 as permitted sender) smtp.mailfrom=fm-294854-20230122192902e1df002ee6af011c92-nCYVTT@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:feedback-id:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJBpCqgmkOP4INxMLxRRfi+HQywRgcgDHJaeKxl4vSQ=;
        b=rs3oyNGxfombVkAeXQS47/z7SzvecgJj0/9tc0oDw3fKUMwea9TqwTLZRnmRcul+ok
         PSSKyzSibQN3EE9vITaIHNP9pEsl7inY4PtCfmytWBI2h9TrzJvLxbRzzJtlhUmh4u6d
         iGBm0cVDEceBGA5y9JYEmcGOPWNBOMFp/8B5XEn2TJZyPsmR7oqGJ037KbApGgv8inDk
         TD7gd0Fg4+yBEhrAsWw9WvRe48JKfxmsBFXjKY4qd37HlBxKu5ZA71Tk8ue3o7AE8j2X
         46EJ05Tq6vyzzzEVwFLpruNuwN/qhxwMZblSH9rvzb0BhqT/GM/Y8LhlOyhNg0MfUO2T
         jM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:feedback-id
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJBpCqgmkOP4INxMLxRRfi+HQywRgcgDHJaeKxl4vSQ=;
        b=sIUgnUAvr6GIH2QPPvMDSGo8eJpx9M8LkNOKEE6WWnqH5Kkn+PgblXWuhVqPHQte6J
         +0+8IvDuGF5t8M/0NbDKuYTQFxSmh+UnHSoyFBIW/JgNnZD7anDQ/PxRosO6hxIRIYwt
         gUQLBPjauU7Fsz8WgQV7PxB5wdy6LxCoOug36XflDVx1INntgRXiTNiRBNuzpJfH23x9
         JrXEJIAxNTf0GSQno6hp/tYDh15YQUNJvpcHJYBtWioyhuXLOrTPeKDIPWWQr6NT6OFV
         9Nu6ysY/6dmKug2Bsp9dACDm4EgELLJVJnFpVgZfuu7uOs+sImuY9GOuUimFIH8NKYgD
         wZjA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2koXxn++Xgt8ui6AgomipdTKfhvPdIODXiaUwqtUWh+mdotaIfiB
	yzPD3E4Mj08xd4SlV2zIYcQ=
X-Google-Smtp-Source: AMrXdXvWMOuve5gAGfSM4Q6Xdvs1ZevcC9EAfpFuQd13SozAgXikdRsoBwlofS4Ej+bmKoPnSd0IUw==
X-Received: by 2002:a2e:850a:0:b0:287:7da8:715 with SMTP id j10-20020a2e850a000000b002877da80715mr1759770lji.201.1674415775622;
        Sun, 22 Jan 2023 11:29:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a413:0:b0:27f:e5b1:aff6 with SMTP id p19-20020a2ea413000000b0027fe5b1aff6ls1274288ljn.6.-pod-prod-gmail;
 Sun, 22 Jan 2023 11:29:33 -0800 (PST)
X-Received: by 2002:a05:651c:211:b0:27f:bc55:1c5d with SMTP id y17-20020a05651c021100b0027fbc551c5dmr6038295ljn.45.1674415743551;
        Sun, 22 Jan 2023 11:29:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674415743; cv=none;
        d=google.com; s=arc-20160816;
        b=uPzI6RETRfX2IM2FIIx4pqFTgZBfLVY93FX9PkzmcfrQrVuhKHkeyw1n4zero8S1nX
         tOyJp8SVaBnEl0hADhVY12kzPK5dJ4Hd4DnTtCvhUaTBv0xwHSSOQcmc3ffRFcnmPyGH
         Ak1/PJbGM+PEXRfP4/ogm57Lb4+0YHQH+Ar8wv6d3+F7LXB/3PAPPcasRoj4ulq3XEf7
         0Ui82a/1pnQW+/2WMhiOpTxOcqmxL2htthQ7TVKubU3cO8oYiNOgsYo6Ys0IKDiyW1np
         G5ruKDzSOtdXx4iAI3/+IbfGIdTa5FQu4seeNBtrjloP4+++U5t2dHVSoo+uMkD7I3tu
         MPcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=feedback-id:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=EpKEAWpoKa4xhyXjkCdvQSa7hCsHL1tUdIWTSlYQKPU=;
        b=PG2/EmfV9H4GcPvbjQH57XsJtc5DMTwV8CpN1YxA1h2XXmH2cEuhINpBxqFPTBUeCv
         UuqShxTHLhMDnPWC3KCR07+LvHh5/R0lBId6+QAmcnff0IcczW40qYS3GQiBOvu4i5dW
         gfTpCLmbkINI4xKGgAkIqYKoJhGceuWcA78Ghl/jX7ij+/nXK9tSr2YgObDbTXANFLE+
         jSKDKlcWC0q0+jSongfXbgT9xVPc605Fo83Mv39NSFE9A4aDxuPtvk3PIyQytnBh91b7
         QPF30vkfnNt8BtTLG6i8u/M0lrKFkF6RDKlTOc8TJh+kzLwwcoYt8BqC4s15xcVpR5Em
         cHtQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=ddWQLcQ+;
       spf=pass (google.com: domain of fm-294854-20230122192902e1df002ee6af011c92-ncyvtt@rts-flowmailer.siemens.com designates 185.136.64.228 as permitted sender) smtp.mailfrom=fm-294854-20230122192902e1df002ee6af011c92-nCYVTT@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net. [185.136.64.228])
        by gmr-mx.google.com with ESMTPS id bd16-20020a05651c169000b0028b62e93f26si837182ljb.4.2023.01.22.11.29.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Jan 2023 11:29:03 -0800 (PST)
Received-SPF: pass (google.com: domain of fm-294854-20230122192902e1df002ee6af011c92-ncyvtt@rts-flowmailer.siemens.com designates 185.136.64.228 as permitted sender) client-ip=185.136.64.228;
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20230122192902e1df002ee6af011c92
        for <jailhouse-dev@googlegroups.com>;
        Sun, 22 Jan 2023 20:29:02 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 02/14] tools: jailhouse-config-check: Add CPU set checks
Date: Sun, 22 Jan 2023 20:28:49 +0100
Message-Id: <d77a509484ad7cea7d9b72f35086492ca7f5046b.1674415741.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1674415741.git.jan.kiszka@siemens.com>
References: <cover.1674415741.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-294854:519-21489:flowmailer
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=fm1 header.b=ddWQLcQ+;       spf=pass
 (google.com: domain of fm-294854-20230122192902e1df002ee6af011c92-ncyvtt@rts-flowmailer.siemens.com
 designates 185.136.64.228 as permitted sender) smtp.mailfrom=fm-294854-20230122192902e1df002ee6af011c92-nCYVTT@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Content-Type: text/plain; charset="UTF-8"
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

From: Jan Kiszka <jan.kiszka@siemens.com>

When at least one non-root cell is provided, check if the root cell is
left with at least one core. If multiple non-root cells are listed, test
the those do not overlap in their CPU set. This ensures that the given
cell set can be instantiated at the same time.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 tools/jailhouse-config-check | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tools/jailhouse-config-check b/tools/jailhouse-config-check
index 95de6fd4..ebfe97a8 100755
--- a/tools/jailhouse-config-check
+++ b/tools/jailhouse-config-check
@@ -187,4 +187,30 @@ for cell in cells:
                 ret=1
 print("\n" if found else " None")
 
+if len(cells) > 1:
+    print("Root cell CPU starvation:", end='')
+    remaining_root_core=root_cell.cpus
+    for cell in cells[1:]:
+        remaining_root_core -= cell.cpus
+    if len(remaining_root_core) == 0:
+        print("\n\n"
+              "No root cell CPUs left when all non-root cells are started\n")
+        ret=1
+    else:
+        print(" None")
+
+if len(cells) > 2:
+    print("Overlapping cores between non-root cells:", end='')
+    found=False
+    for cell in cells[1:len(cells)-1]:
+        for other_cell in cells[cells.index(cell)+1:]:
+            overlap=cell.cpus & other_cell.cpus
+            if overlap:
+                print("\n\nCells '%s' and '%s' share CPUs:" %
+                      (cell.name, other_cell.name))
+                print(str(overlap).strip('{}'), end='')
+                found=True
+                ret=1
+    print("\n" if found else " None")
+
 exit(ret)
-- 
2.35.3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d77a509484ad7cea7d9b72f35086492ca7f5046b.1674415741.git.jan.kiszka%40siemens.com.
