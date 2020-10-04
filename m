Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBO5X5D5QKGQEECOF2TA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCB1282CB5
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:12 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id b17sf798467ljp.3
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838012; cv=pass;
        d=google.com; s=arc-20160816;
        b=CUHS8FXPGvs54UZ79rda9irrRQ+6HTk/SyAf8BVf6OJmAJsx/Rt9pDA6rEapTB2LDh
         g9fvROPEzDyKb5RRiLTDuEOP2CmRM7VAM8cG/hMznVOgbb8JtnPUSmrRktwgN0R43U7a
         CABSqm5Lxi9ahbSI2Cu4k/TSaCZ8IyyonP2YqiQJKexrapuFjhWSYHfZc4I4+lobMjrh
         QUsWZQERvkFoF4G+9mGTKEckmv/0Kry6slfpUf0/djpt+iS+W9CNPUt8My2tamqcbISd
         +BJuApxA9+bCYFRiXq0EJcIZ0grpbPGFHPcNF+45hzP76zbdvnZ3uJIADMpNO5cCbNDE
         M9gQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=SjiyNssJo1T7ygcGswOkqXWIG3/9Iu6SvU8NsaqS5SY=;
        b=cwvKPsj3F7hSWrRS6JpEN18+AH8YGBauHJHVtQsnUQA+5wqpqGpYiTI5MN+IEynykU
         BGk07jLUy79G5OtR0TgIH1sVQqHf9/0yLLGOtReP2dppP4PnPvgN6z/K81lYK6luQzOR
         4+OV0HWaksJ9HK+rfMLWcUq8BeCcrut9sRJGJCMS8x317brVNS4SN2J6QK4FuLcic2ei
         DdVLxTrb129JR0bdYD5H6qntpNe+xc7SBhdj3yBCZleJHFWTztXUlG/xdIqNDn1LoZW5
         6pjiFpcUMvKbcKQ+OuzO2znRtdYwcfk04K0Aph/t3RR2Vh69iJ17qlTTH7GzaO20W/m9
         McQQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SjiyNssJo1T7ygcGswOkqXWIG3/9Iu6SvU8NsaqS5SY=;
        b=csQdUvXkGppNJ5IHdfJIoNvMr6kXsV4+5roIpQuy7Te4JnCXm+4NyxlIyhPNlW/cOv
         edo9Sq3xiwJWl1wiD1V7IZDfCawpboaHNFjm29xbbZcZR5JToLL6Z5roAaEbaXyxIBaL
         RBBHCKY6yaC2YMy7ATweR684w03ZfyE9wZuTmblZldvfCUo883PjAqQbHAcklGbQe6aB
         uQ7E7/d7DZ/IGGor8no9oURsvaMXXGgwFpziSo4mNp5Jd/g2+EK0x0kj93/Pcqph9l87
         +uUJAkiqbGNowKTKhVEdk7QiG4iAe4go7I7pGndaP6N/MZjGYAgxm2zU7t7cXC8Nb7PJ
         +FHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SjiyNssJo1T7ygcGswOkqXWIG3/9Iu6SvU8NsaqS5SY=;
        b=XFeFMlCF01UNPetJOcCE+4hBotLeC8Eu4Ile9DcIsiKjV175p8Bw/Y/5cEPXKax7+f
         WgB0uV1Ds9zPpEmeE+v2+3z/5KM71kcqze/j6sCKSaP5Jo5dbEzKfCQPublNbwklzzqU
         TJm9EAy/SV+dHdO6c/ZQ0UPCUjkKfrR0IR0NkK6dNFysVqptjQXjhYqYtGQF3wiJzesa
         bree+TNoGzOQ/6CxJqRt3REDcgHwMnIgkv+ybJWdNLGm0s2CnTQKHpEtdogku0UlD+76
         Ac2S3tJPRJrJVTTJWzOnzHItbcEmR5VD5NlOnfW3gu8yKHlH/4fatmAd8ZmXdmhrJozr
         lmyw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5320F4xtj9beAJeJ1QWDwA8BeUy4/D8irjHVXAVH1a2Ai7L05oAB
	AfKT2/5aCS35dHkakGtphMY=
X-Google-Smtp-Source: ABdhPJzAKyZZtssnpgkQuteu/PPQFW2aJzq/2DTbSsH2AgdxLD7DkO4mmkxlwacNwk/5IRsHeL/WmA==
X-Received: by 2002:a2e:3910:: with SMTP id g16mr429484lja.18.1601838012082;
        Sun, 04 Oct 2020 12:00:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7c08:: with SMTP id x8ls751294ljc.6.gmail; Sun, 04 Oct
 2020 12:00:10 -0700 (PDT)
X-Received: by 2002:a2e:3619:: with SMTP id d25mr3401808lja.369.1601838010499;
        Sun, 04 Oct 2020 12:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838010; cv=none;
        d=google.com; s=arc-20160816;
        b=j+5zxyOpP7eAW4FYT4/r8JMJm+yyVyiKqlqknkuOP2DOrhkRcokt92z4tdzh7rxqxa
         r8+D21mX1giEjTJsiBj51iOK/8YM1u8Y0TVhSIfZX1lF0VA4xwCp5QsNQe/IYMO8/7tK
         C2o5VrP86f74VC1vmM79i4JIWUuZOq1keQ0lHS7rMLqoPEri6/23aj7s+lDslQyiGm5J
         lNZ37LedaiTkZMyLX3YITCoJ3wmOB2JlQPKc3i7VjlqXGuFjHDOyq1y3tUMAUvkKoLxz
         68trWNDNlKKqsVNlI5KSkovqO8/99TJ4T3tSmtxn0W7cdBC9JKPiKMOObgCkW16v2T9f
         Bogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=SOUg7RHcPSG1GCg9ONKoy+znFychN891Qal+S7MkI1I=;
        b=uEpP5mmVh2zGC6OgUp8xmcvtvqdOBEllIU3DtFXKpQ4T+ur3FO7olsxotzKoZ+h3Vo
         PhPGWzQYNMG8PS0FkUd5atroCDN34COSbwdZvp18eapm1K30J04PjMUiT1L9mql/E/2h
         a1r9wQgVpZbaplyDV3jverqCB5TwQdpfEhAaVa0wCshJBRGBg2d2CK+IRvorfhpCS5AU
         wQ+UFLo5dzGWspxrQN+PWrvy4/+BTYOYQ/fwq6h5mJKBYI5hQTaSxo2fj3nJuHL/bc6o
         Cq3zkTKaXnYDAVtZNDPawE5wmrysQ2sPasn3WOICIMY1LapmdFV4P/CRRgLvf8LL9kKa
         ICGw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id r13si135905ljm.3.2020.10.04.12.00.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 094J08XY029704
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:08 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060F017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:08 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 03/45] arm64: Simplify get_cpu_parange, add 52-bit case
Date: Sun,  4 Oct 2020 20:59:24 +0200
Message-Id: <7434305f16589d47d0248ba127edd82bf234d9e0.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Array lookup is simpler, given this input-output mapping. Cover the
52-bit case as well at this chance. This also obsoletes a couple of
PARANGE constants.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/include/asm/paging.h |  5 -----
 hypervisor/arch/arm64/paging.c             | 19 +++----------------
 2 files changed, 3 insertions(+), 21 deletions(-)

diff --git a/hypervisor/arch/arm64/include/asm/paging.h b/hypervisor/arch/arm64/include/asm/paging.h
index 67664efa..932dbb50 100644
--- a/hypervisor/arch/arm64/include/asm/paging.h
+++ b/hypervisor/arch/arm64/include/asm/paging.h
@@ -101,11 +101,6 @@
 #define SL0_L0			2
 #define SL0_L1			1
 #define SL0_L2			0
-#define PARANGE_32B		0x0
-#define PARANGE_36B		0x1
-#define PARANGE_40B		0x2
-#define PARANGE_42B		0x3
-#define PARANGE_44B		0x4
 #define PARANGE_48B		0x5
 #define TCR_RGN_NON_CACHEABLE	0x0
 #define TCR_RGN_WB_WA		0x1
diff --git a/hypervisor/arch/arm64/paging.c b/hypervisor/arch/arm64/paging.c
index db8314a6..cccce410 100644
--- a/hypervisor/arch/arm64/paging.c
+++ b/hypervisor/arch/arm64/paging.c
@@ -26,6 +26,7 @@ unsigned int cpu_parange_encoded;
  */
 unsigned int get_cpu_parange(void)
 {
+	static const unsigned int pa_bits[] = { 32, 36, 40, 42, 44, 48, 52 };
 	unsigned int cpu;
 
 	/* Larger than any possible value */
@@ -42,20 +43,6 @@ unsigned int get_cpu_parange(void)
 		    (per_cpu(cpu)->id_aa64mmfr0 & 0xf) < cpu_parange_encoded)
 			cpu_parange_encoded = per_cpu(cpu)->id_aa64mmfr0 & 0xf;
 
-	switch (cpu_parange_encoded) {
-	case PARANGE_32B:
-		return 32;
-	case PARANGE_36B:
-		return 36;
-	case PARANGE_40B:
-		return 40;
-	case PARANGE_42B:
-		return 42;
-	case PARANGE_44B:
-		return 44;
-	case PARANGE_48B:
-		return 48;
-	default:
-		return 0;
-	}
+	return cpu_parange_encoded < ARRAY_SIZE(pa_bits) ?
+		pa_bits[cpu_parange_encoded] : 0;
 }
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7434305f16589d47d0248ba127edd82bf234d9e0.1601838005.git.jan.kiszka%40siemens.com.
