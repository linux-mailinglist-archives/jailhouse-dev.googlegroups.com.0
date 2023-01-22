Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAE5W2PAMGQE6MM3TEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3E76771DB
	for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 20:29:05 +0100 (CET)
Received: by mail-wm1-x33c.google.com with SMTP id k34-20020a05600c1ca200b003db30c3ed63sf4462295wms.2
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 11:29:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1674415745; cv=pass;
        d=google.com; s=arc-20160816;
        b=H2t3F8lkuc0C+6iZk+sUv1By4HLXsFuVhOP4nFEdCIs2T56SsjPpBOxZPfGnKYPCPY
         5IZOqQJ0B3rp8sOO/2RZ4Ko05f0FWdz+arIxvtM3j9DgqjDM6jv8qv8wwOf+XDFQU2h6
         8++kpNWibMz0CnAIiV9wBhJVyHvBFS9qCOcGa6wkR66oVDJKkGrtVftW9Crdj0psd2Wp
         Go0pU1YdLQLwrWh+EvcYHUBlBevEdwMfHkjbm8hQFrnOxqozKcdgDj2aldmHmoyTuCWI
         hROjlBNwl8UA3RmDg7sqLBV5wjaWw9c6rXSZf0QmpnlcItpuSs5RSH/ls+yROSlHMoux
         EFLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:feedback-id:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:sender:dkim-signature;
        bh=g0Id5podxInBz2wM+Ij4LgQLNeVRCJDYFNtYDLuQRsM=;
        b=l3zlwg+li3JfhJjDlyl55R7JpfqlzQn7R59xYLt3rDzoSQFxW6ru9VU4s5bn6vXFIr
         WFPmTndgYVhw42Bjdrp94Nay3PraADoktrqJ5klf1V6xproyuhzJdK05//cG4ZDpmhe2
         T3YoJCXNh2ocVUSONotkoBgu+eck7ZYDUX2RjmudU9U1qN1WMgiyL8QUL37YNgNb+bdw
         RKIJ58uiyZ4KE9D+VG4eqt63plvAJU79QPALuUSO4rSwUrxyOYDXvknBCuHIBJuqlWK1
         zKF9Jvg7Sq80Ky2uEWGLnzd0yyfqUqctY8I1BFmXpg5nb3ddcjtQtLmb5gEJaCoSWIeK
         cP9w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=RrnAyRvm;
       spf=pass (google.com: domain of fm-294854-20230122192903d89ef7ccb304c55f5b-533bx5@rts-flowmailer.siemens.com designates 185.136.65.225 as permitted sender) smtp.mailfrom=fm-294854-20230122192903d89ef7ccb304c55f5b-533BX5@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:feedback-id:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0Id5podxInBz2wM+Ij4LgQLNeVRCJDYFNtYDLuQRsM=;
        b=POPflte3MyrSDp0NSJ5RSWQ5IHKcQ75RvbCxw9GsScB8hJGD/acdJ12n7/HIbXtTkQ
         Xi2z8n65rIenSwuCdx0m4bsmQvyQk1ZA9+LSjyrq//j839f5DuVZJzvznsvED70+gkOA
         2r+sfHe20ursJN6PBHpB/l40ZmPTqFakt8u2+T4CPN+tpLQxfS9R4iSFOw3Hv0SPi42r
         hLIr6P8yH+fmulxVjwu1LkSh+oe3o62P7RyfXuQDOhXa0s1svKJd3S4EA6OE4yQvb7Gw
         Fig2lhzfxJ2CWchw+nPBeecD67i4zoM+dhGHMHI/zI+BYpZewKYIJMqsLJF1ZnjqktmK
         rYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:feedback-id
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g0Id5podxInBz2wM+Ij4LgQLNeVRCJDYFNtYDLuQRsM=;
        b=reVc5AqrBRxaX+aiLCa290tgoiBchr6WgQyfwtjL2HFfpeGDHW85ecjK5PNet9sn36
         UAHRpaJ05R4o1Op2wJgjZO0D/gyU2ZMTVmWzlrRRXT8x+JK/gQxWXzc2Q35+xiLe+JF4
         pmFbD1CI4yMZsTp1i2/9BB6SzKB6VEnSIC1/e51NCVfIcidW297gk1+ZyJC0yQbV6bDa
         m1dmS8D+ayn5DwUlAf1UFHdi5joSUhh2FqSTKi4pIYoZpJAxlE27xyB2CDHG+V3jcgbb
         44YrUxAQh/k31yMUPi4y2SShafSNOvGu9jR0wYRg5Gr+vY33jNyXsaa0n0/IwyYZQZff
         SoUA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kqn94totP1PROhZfM9P8wj6jM35T/8F9gzDyqAAFkL0Vc0KUOC9
	/OsUvXbCJBDFpFVsyzXGOx4=
X-Google-Smtp-Source: AMrXdXuEmZroZARS5JK5KPfmJqcgL+p8WjvlTjLdCnxFQdeEUljuzMYmtiTQjDBqFYKIHnXAELAE+Q==
X-Received: by 2002:adf:f944:0:b0:2bd:d395:551e with SMTP id q4-20020adff944000000b002bdd395551emr1244275wrr.719.1674415745271;
        Sun, 22 Jan 2023 11:29:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:e909:0:b0:3d9:c8dd:fd3f with SMTP id q9-20020a1ce909000000b003d9c8ddfd3fls5350070wmc.0.-pod-control-gmail;
 Sun, 22 Jan 2023 11:29:03 -0800 (PST)
X-Received: by 2002:a05:600c:5028:b0:3db:1dea:75c9 with SMTP id n40-20020a05600c502800b003db1dea75c9mr13482831wmr.28.1674415743876;
        Sun, 22 Jan 2023 11:29:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674415743; cv=none;
        d=google.com; s=arc-20160816;
        b=eKJeeLXDNTOIG8KlkbCeLleCxLH9vwbgDw1npRnBf/ubzkXI7spHxEPyVv/1g2Gp/q
         ZmR/9eW6Gy9HlhHZf9Idpv3uvLqe3ZjaIrttgRwUu6CUHd7VFfe6r3ELemc9HLhWtwfl
         urmEUFaod1wL/wq9iFqjP9Y99Q0AwPqaadIukyMRHvAGXtgtDOyJqCnZHGK3oj98sX0E
         +ZyxVDdMu4OUKfIcUxOoOV1TB/SmEaODCOXDvp5pYD4NeTfz9jDPetMqLR2RLe3mdk1M
         elwgMYILwbbPle/5EU+sPlVV4/GAOBULMoCixlq0tHyboGAArO6E7pX6gVQkoI5dBBSb
         FuPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=feedback-id:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=PvV4v8YHOtinBJ9yx0m9wNVuk7PVVuW8rSFV4gAxpUc=;
        b=s4z7ivKAJ5AIphiIJ+o0CX94qje+vk4tx+GfxQrcbWSetM5mbn8lLnY6EbcvSXkgE9
         wsnnRoTAsscJjf0CVKeNW+w0v9QkH7cHfIVHqlX6bxjvsh5WV00qQ3MupNOp/Pshz0nE
         JDVKNT6U95JIIbLLBbZKMVl/hmswH5DIPgLgZncD9V+IAnbti0UFbOGNsf30+7IHZngc
         Qy7OCZ20uUSKXAFwZETr0ljYzc01MUVivdpM/c68EK67ZrmrMTes9uusn3jkiGBxvo6j
         uizt0AAPLrR/bHJB4XWxbI5UtZv7Iutbh2r97LR56tSoSZfkcnE0LKrnDnsSLtGCgzE4
         wauw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=RrnAyRvm;
       spf=pass (google.com: domain of fm-294854-20230122192903d89ef7ccb304c55f5b-533bx5@rts-flowmailer.siemens.com designates 185.136.65.225 as permitted sender) smtp.mailfrom=fm-294854-20230122192903d89ef7ccb304c55f5b-533BX5@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net. [185.136.65.225])
        by gmr-mx.google.com with ESMTPS id r6-20020a1c2b06000000b003db0037852esi637170wmr.0.2023.01.22.11.29.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Jan 2023 11:29:03 -0800 (PST)
Received-SPF: pass (google.com: domain of fm-294854-20230122192903d89ef7ccb304c55f5b-533bx5@rts-flowmailer.siemens.com designates 185.136.65.225 as permitted sender) client-ip=185.136.65.225;
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20230122192903d89ef7ccb304c55f5b
        for <jailhouse-dev@googlegroups.com>;
        Sun, 22 Jan 2023 20:29:03 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 08/14] configs: arm64: imx8dxl: Mark 32-bit demo also as 64-bit config
Date: Sun, 22 Jan 2023 20:28:55 +0100
Message-Id: <ea65df766392b069bf4e4a5fa1efc9f05b3504a9.1674415741.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1674415741.git.jan.kiszka@siemens.com>
References: <cover.1674415741.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-294854:519-21489:flowmailer
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=fm1 header.b=RrnAyRvm;       spf=pass
 (google.com: domain of fm-294854-20230122192903d89ef7ccb304c55f5b-533bx5@rts-flowmailer.siemens.com
 designates 185.136.65.225 as permitted sender) smtp.mailfrom=fm-294854-20230122192903d89ef7ccb304c55f5b-533BX5@rts-flowmailer.siemens.com;
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

Coupling the config arch to the target arch was counter-productive as it
prevents checking the non-root cell against its 64-bit root cell. Even
if the inmate will run in 32-bit mode, the config continue to target a
64-bit machine.

Fixes: f2320d2ee4de ("configs: enrich configs with architecture information")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm64/imx8dxl-inmate-demo.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/configs/arm64/imx8dxl-inmate-demo.c b/configs/arm64/imx8dxl-inmate-demo.c
index 7da204d2..3d2296d7 100644
--- a/configs/arm64/imx8dxl-inmate-demo.c
+++ b/configs/arm64/imx8dxl-inmate-demo.c
@@ -22,11 +22,10 @@ struct {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
 		.name = "gic-demo",
+		.architecture = JAILHOUSE_ARM64,
 #ifdef USE_AARCH32
-		.architecture = JAILHOUSE_ARM,
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG | JAILHOUSE_CELL_AARCH32,
 #else
-		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 #endif
 		.cpu_set_size = sizeof(config.cpus),
-- 
2.35.3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ea65df766392b069bf4e4a5fa1efc9f05b3504a9.1674415741.git.jan.kiszka%40siemens.com.
