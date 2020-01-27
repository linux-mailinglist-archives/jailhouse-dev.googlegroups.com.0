Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBEGRXPYQKGQEKXE4GAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F1D14A543
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 14:41:36 +0100 (CET)
Received: by mail-wr1-x439.google.com with SMTP id t3sf6038629wrm.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 05:41:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580132496; cv=pass;
        d=google.com; s=arc-20160816;
        b=cPeYSyDnF835i2cIEs6tlyGmBvPPrnGrgKTcEJ7uMklI59sJd+gy9to9iS+qzmo2dh
         3HWpvzA1em386XY/OopjwSH9HDkQ37xe7YBj4d8XsLDKUcZukPlEw1sKTtbDVk4FE82+
         1JEskdJQ5sdliLuAajTxpbhUV1b1RAtwgpSmVczLzWSCnCos63i6GB/cm+c6xRDA4+w3
         UO5lBsdA+BIubLeE9xU8/+sW/CQeXWH5sSDPD2+3ic48ClJculcbiZaQ41Q7yMj+uDGT
         OEw2zjAF7jX5RD9ybnvAbtNyyc0EHvUJLhhMKTetWRQ/99/B25UAncxKJN2li5BsLTyS
         VrQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:mime-version:sender
         :dkim-signature;
        bh=UvU0uSGu8r+z6yDZZCi25Bvkg2nWJSgSwZ7cWClQm0I=;
        b=b/G39wwwHtao7ox1UfJ3w8aPcJKpHKMua1yytYT1mznwtYK01aIpiAwGC871gaFKqP
         XQzOEiB7KEj0GbOstVYfwwewDUgW1PzoxTy2CyAkoH29H3h4to58/JqL0s/eR7LdrseS
         z/rSykbcRY3NS81piFkyTdRK55u+iO71LK9ut65yGRvzrbmA3Mxs5JqO/V1iC4PnI4zy
         Hid7SekjmFb0NoHNPeEKofX1McSx4qPFEpTAB0lqh9MK4Us8h0BsI0iDV8QR5gxrgPZ/
         mrRwfl4CPUseJJLnNKGiNFQ1UmM9qGAgBYD2+l8XNBMaixNZzL9FV+NoVDA8y43XRFM5
         Ci8w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=IRGEIZwq;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=UvU0uSGu8r+z6yDZZCi25Bvkg2nWJSgSwZ7cWClQm0I=;
        b=S6LLXYZpw7GAYh90yJK0hk8uC5Y6y+BqVvp2HvUSuArM3/E70+Cw2UEpzqwSLTPwAB
         U4AXWA1OnnbNnkywa+R231H2Ki0QAPH5Ds4FwowxqvvEx2tP8kkAFsvGYs/MpjaJCtml
         Np16GakyCZpA1pszO7Lm109R0oRdoMkIl7c9gl4qAHX8IzlS/Kr8ioTM5LaUVa4EeSEs
         DoU4GVWli3N13S/DB4DDKtJacO90LaZuuLgunFg9VeqNNX6Igsfuvc6DoiINASSIEYNf
         zqkSaul3DzDu19B4PbSnUguLxj3QP3D6UE3VSBkN+qS6sgKHxq7mOKZFfSAUvUricuUq
         7X4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=UvU0uSGu8r+z6yDZZCi25Bvkg2nWJSgSwZ7cWClQm0I=;
        b=V6OkHD71sTHhBU74NEzo4PdHrTVrLDiR/7f6zvKG9JXGucZDrOuiROuaH1NgIETLqj
         tMqRvwOqqdnEH6eACo+xhJzdSoLoSfSl1wa4/22NWwImJ+9LJHnrip7yypqH0Z6rL4YD
         IVrd9wMS7iobFPiDUvnDY3PpSRS+R+GYv6R68Avzv9O3eZ2UbTz3xhh11uYrIqbd3E2t
         GynGk4QmmlWdH0C+umhN9YtnJuD3h1hc8NbojIKqakpRjbx26NM7BHUzNgF0qTc+JflK
         jcgkiU6I1PHN0oXpRd/BxD0QSjffWW9uvPgONBL9nT3iu9wWFJmZTB1eo2Y/SUTvd7Wz
         9YyA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVgEu9ZUaYATKT6I4+x6ODxJc4Kj1MYOy6XBI9PijHx6w3k/WIQ
	qFtsxg0tx+TARhtzThXw9us=
X-Google-Smtp-Source: APXvYqwxd8kafZwAhh4o+QUNCnPERYfhGAZoEPgL8QSHfPZsp1Vf2PSu7elgUT6W11zHXVWwlButgQ==
X-Received: by 2002:a7b:cc81:: with SMTP id p1mr1043726wma.62.1580132496254;
        Mon, 27 Jan 2020 05:41:36 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ea84:: with SMTP id s4ls6673527wrm.11.gmail; Mon, 27 Jan
 2020 05:41:35 -0800 (PST)
X-Received: by 2002:a5d:50ce:: with SMTP id f14mr23152203wrt.254.1580132495566;
        Mon, 27 Jan 2020 05:41:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580132495; cv=none;
        d=google.com; s=arc-20160816;
        b=j0Cr2/OMslbPMnjnwiIgs/Ulh+RNtt6xhKchlCgcJ0rav+EhVRD2oJwpd1RzAAFKxN
         IhEe9YLAThS8jz8BIy0Rwvyqla2s+d1J2V9H9mQrohY5Jvt1v3qXA1M0lD4N+Qj3kr6/
         Hp6T35c06rOuTFB/evkOFpuXPR/iWnkDm+T5+5xMc8hBzCHQ8yzLqIvENusecDOIxNFR
         opzy6PyochstxyYK89YFGcZDorcX12kw330Dsz/nCFrd2BkqDDTjPw5qzv7SXVcaOCu8
         PCMWAwDx48KmEzVs7xsQbSderhz1sLL43jYpEqoP9dhExaNjc6KRwmrJNv46KiuE/Izm
         nnBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=MEnZZInl7AKBz9kV2tMaNaEb8uCypt6O876FxymtUa0=;
        b=MvONX1Gq04Br6iCyAVfeahYRMedTlIZSlT/DIT6qG00StelM9xRHsNHgLTDE1lfczk
         yEXhgpKlEwZcCT9Ysi69xMbPCVgA0Aj1DwnZSzHvzcsAf13bdk+UJl59UuyPFBmg/A9r
         8ebwVYDEuvfPU3gKaiCPky38HYIK61r4A55l+6gtC5x0DOBEbiUtSINqRYSnxHgXYljz
         Oedq0/+KlEv/tFykIAwu1EmeC4CU4JpOjhvCNAyAW318QuKwT+g49iSHlWcg0JG0fMJk
         RoNB9jWyjwxwqkg55OZHp/1qQVnO7kvV+2Pa6Vz2U+pt2GXli6PJ3D7Q+B6/sQBC6akb
         +oRw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=IRGEIZwq;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id m2si913594wmi.3.2020.01.27.05.41.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 05:41:35 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.55.156]) by smtp.web.de
 (mrweb101 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0MLgZ5-1ivnnI0CzD-000sY7; Mon, 27 Jan 2020 14:41:35 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 3/4] core: Mark jailhouse_comm_region as packed
Date: Mon, 27 Jan 2020 14:41:26 +0100
Message-Id: <da42249bfb6543bbba67a0f6b604071a21a8a490.1580132487.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1580132487.git.jan.kiszka@web.de>
References: <cover.1580132487.git.jan.kiszka@web.de>
In-Reply-To: <cover.1580132487.git.jan.kiszka@web.de>
References: <cover.1580132487.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:wa4cOH+jBOdRXZ9DOJl82zS4jD6KkeuOtVoc3SDz0AHCN5MXzKW
 oCnJ13J3N5RrcIYsRhQ6+4S6V/D0UJ2qB02OgCwmF6GhtPQOg2uL4gNhH8DSKz0iZwtG50o
 4kiYLoUCV61HizxCWiSZz/itrabsg5fitldOTCVLtNCYrmLfx0etkqYGvLqpxSmCSi/RzMy
 QsORI66rPJ9o37JU4VFAw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UxLyCthK41E=:Df2ge4F7fV2CXAPOnovwSZ
 1bnQ7KJTTBJEgjOOYW8mlSmcUYVf1rzgQjc66j8oLHdFHoJ9C2A2WjBzAJKQY1zUYeMxHPemn
 DWHn3cKjr0Rk78lFYSdhj1KKUCpC7t+c/tJY8gym8i/CT2WHfwY1+gYlDSDs37VyfnVukuLUC
 B15MJ95jKrRRKvci/KP2/6V0LNW+dQ8KSJbKjD+oOLCpJYthdu3pOM44JoeXJF8BXT8c03eqT
 zyl1Fohe2XKjpNNAzbSvK0D60K8IrG+Kd8VxmCeHz+u5Dooi9SbyuTuXE2VeNd3G6lfZn7wKe
 7B0MBYnV7aQkNrGWsH1rzIxlkVXBoYGUZk1HhMcCkrGoDXczZZRBntw5B5j0IQOqJ+6aPsKcP
 ANeHE+dfSTCTCbn32Mv+nhs4406L371QKYgquEbHLzRyW23wxbHDb4TINHVo6jVBeSGt6kAbD
 LAWjSh+kChXJCdUst5qJNrOzCZi4fxgpyV0Wgi3iidLcYmytg8A0Ud3F1txZMMay/v6sH5H2Y
 boUPYkaN7d+OQCrAw3J5H6lyl2lJsbY98IYk0qCAtc6v0jpj1KIk01YR+X+G+A7oDh+OHK3nz
 U7+QWMt9VA5ft5/iVt3WhqCYskf0ai2U07VWg5MuqYCcJowfWysClJ7CT3C6CrhT+0zGNAJJs
 X/En+v4U38cUFamTYeBrLYwPzrc7rg5kZET07EcbLMJ/rEX9hOM6/CG3yJoLUtj4Y+E6L98jR
 Em61DkdtqoQclyRQFrJWj/IivrYD9evWkC6Q8SUuRgN9/UVa1/Shgt8g1+KPmlSsP1DZQgzWB
 Kewga7/DB2lTt1DJ3LQd+Wbol701uA/wpYWDElGhDqTddzPChKYt+R4UNHMO674Mtrcs3MTy7
 wpNZ9R8TNRJ7f9MV8Ao2MJirwK/Va5xmnHD6ViwgqB4cxMzB03TjLBJ5zHWRuDy2jgBKaj+XZ
 h5C3cphBKDmgfpiQGPATj3oPiHXs8yhFb+u9cT8XWdYBV9SN+sv8tLJB9r3FNTQ2GjqmMO0hY
 9TQKk44ZxniE65lN33B56lARBNWCelifHLh+ONIz7tBWfFRl0LucpLdQVwCVAgFMUFb7/74h5
 DVuwisia8xhoGKZvhtXlLx+mpMgqX+N7hEiy7pEdqUcsSMP9OOZBUmHKpdMYr6ZsAbebLO0ka
 8tlu9cZ+4ncv4uVAilibxY9V0oswF4ikYkqdFMnsWmrBC1texpgwjZWKZWGG6jCDhHAWYXomg
 si6XMeV7GnNzfdsp8
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=IRGEIZwq;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

Ensure that we do not deviate in alignments, even if the currently
achieved natural one should once be violated.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 include/arch/arm/asm/jailhouse_hypercall.h   | 2 +-
 include/arch/arm64/asm/jailhouse_hypercall.h | 2 +-
 include/arch/x86/asm/jailhouse_hypercall.h   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/arch/arm/asm/jailhouse_hypercall.h b/include/arch/arm/asm/jailhouse_hypercall.h
index c5c1d45a..275d4891 100644
--- a/include/arch/arm/asm/jailhouse_hypercall.h
+++ b/include/arch/arm/asm/jailhouse_hypercall.h
@@ -60,7 +60,7 @@
 struct jailhouse_comm_region {
 	COMM_REGION_GENERIC_HEADER;
 	COMM_REGION_COMMON_PLATFORM_INFO;
-};
+} __attribute__((packed));

 static inline __u32 jailhouse_call(__u32 num)
 {
diff --git a/include/arch/arm64/asm/jailhouse_hypercall.h b/include/arch/arm64/asm/jailhouse_hypercall.h
index 497ba504..9daa21fe 100644
--- a/include/arch/arm64/asm/jailhouse_hypercall.h
+++ b/include/arch/arm64/asm/jailhouse_hypercall.h
@@ -58,7 +58,7 @@
 struct jailhouse_comm_region {
 	COMM_REGION_GENERIC_HEADER;
 	COMM_REGION_COMMON_PLATFORM_INFO;
-};
+} __attribute__((packed));

 static inline __u64 jailhouse_call(__u64 num)
 {
diff --git a/include/arch/x86/asm/jailhouse_hypercall.h b/include/arch/x86/asm/jailhouse_hypercall.h
index 4872fc32..8dffb5c0 100644
--- a/include/arch/x86/asm/jailhouse_hypercall.h
+++ b/include/arch/x86/asm/jailhouse_hypercall.h
@@ -108,7 +108,7 @@ struct jailhouse_comm_region {
 	/** Calibrated APIC timer frequency in kHz or 0 if TSC deadline timer
 	 * is available (x86-specific). */
 	__u32 apic_khz;
-};
+} __attribute__((packed));

 /**
  * Invoke a hypervisor without additional arguments.
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/da42249bfb6543bbba67a0f6b604071a21a8a490.1580132487.git.jan.kiszka%40web.de.
