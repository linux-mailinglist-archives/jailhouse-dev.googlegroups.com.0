Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB2UGRGPQMGQEW4XNNJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AE468D699
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:19 +0100 (CET)
Received: by mail-lj1-x23f.google.com with SMTP id 17-20020a05651c009100b0028f23beb02bsf3520390ljq.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:19 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772779; cv=pass;
        d=google.com; s=arc-20160816;
        b=B9tUdirnx5WVKIbt53sSD0pnbKx+gzp6KfscU7AKRbLdvDS8+z/g58LpgR0tFm9tz5
         4om9SchjETJzh8qNZn2C5NTup3e8jGRMj4dyfamuCapjAP8vKN7UBJxwgq1seAFouK9k
         snvhmMRWV+b0RIxYriIRlBrnRBP2FFiTLneFxpGiLk+P/pEIXw6OLTwv2pSg1IWG9+s/
         BosUN/z94r/SKO1FPB25qZaiY8petNk8lYC/FpwAtogyHNhZlymZDNkDn/soqYWlzojY
         x6x/QQb8P9cy/GBiuyr6xIT+u8BVpRoKyVlyWdGwBwCRStfvB56b2zQWXpeUFaKvj1Wm
         N+5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=9w+PBq8kspwRsCEdbynMJ7TdcC2ZmWvOTsbw7KlSrj0=;
        b=OiYk/U+AHIh/swbaq1WtZ/zXANdNL5SS3tMZCFmDWRWYHs35b/bBWFyE2SxGvnqboA
         hg2ZgUa/w2OMTY3hQPhS4+vy95eOu/UixgvSnoZM7sjsjb9ikYOYsNvCScv/2YuL9as7
         cbcSAry5A2nHAtIPLoV1EeSCGjAn1zhMAmokcGged4a76zVhVUad2KDIvFcy0H8UjTub
         V4eq7TTT6XrE+RRI1bfPd7b8bkna3iPqp6BzZzH2tS4RepU2tXuybqO/btwyEWT2tm9Q
         RU+UyRcO71L7U5hz/Y0Ma6uI/B/V399N92ijoAPjIHbnJGageIpddW1qr8alt7ZZqgkh
         N0Cg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9w+PBq8kspwRsCEdbynMJ7TdcC2ZmWvOTsbw7KlSrj0=;
        b=MsiSDsmr32dWaSQZxd51gQZUfaBHCAFOA8cQQwrFijJe8/nQMWJ5Uzd5ii3Er6phF+
         xD10FjPK6mcWlM16aCS+sJEhWAFH+yYz1RFhSS2sGWbTa946YphHC9A1w2kwV55im54G
         GCTcp4dHOYN3Yih8vejOrqmbC3sDf9YGjxVjvHLLP9YPnoam+nHaSJy2W92Qqc4wFdbU
         RkbTGQu7NnDw6Dtdrcma+5XLnZp4eY5w9rNMbcXZ7khFDzb1JUKE8bAMEcamxi72sZyV
         uwusDHhfVZ3/eJUDezhreXtWsjjxmHledktl1HKR1u5edrcYi5mCvtmZuQM9cybva/jT
         pUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9w+PBq8kspwRsCEdbynMJ7TdcC2ZmWvOTsbw7KlSrj0=;
        b=B3rSOau3nckTjKj3koRCqwsXUmIXUrElC6sHhN4Rz8Gdpz+h2HHdHiTXUUY9kd16w7
         uY86DEu+asWLnvI6yjmY33kod3rLkEKevDwdBi7QJ00G6aUrW0Qpyz3eXA2OyMO6zrAS
         NpQCr2pS1LJJIPf1WdHgmBFdVpsOFHW+IUuWbtXcoBoTWJjYBmnD0gSEBp7a/9viD4Nu
         dWbVqiD1wHfwEB3SqSOTv6Z3aroPz+lRbpv/K1iJkzOwww/gm6abhGSao0CgrfSZ/wgW
         cGX+cCQdgkISdAyT5gleDJ+VGt+qfs0y694UIv2d8hitko4IAvrWTWBrVIwtHPQyBeDC
         baqg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKVngmfAwReG0aBvIBCdKa1xCJWkq9S/6fWr/Chakagw0QCVTBO2
	sCsK4xuO6FyO0HvghKrhnJc=
X-Google-Smtp-Source: AK7set8XisFx3doGrRr5I4thaki03at68o9Gvk2bvjE31BVSnpqfqiJ4b/j7HQ/DT6Mvgrn7JLB+WA==
X-Received: by 2002:a05:651c:39a:b0:290:4f23:8360 with SMTP id e26-20020a05651c039a00b002904f238360mr407321ljp.121.1675772779319;
        Tue, 07 Feb 2023 04:26:19 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:4006:b0:4cf:ff9f:bbfd with SMTP id
 br6-20020a056512400600b004cfff9fbbfdls72477lfb.1.-pod-prod-gmail; Tue, 07 Feb
 2023 04:26:17 -0800 (PST)
X-Received: by 2002:a19:ac4c:0:b0:4b5:2ef3:fd2a with SMTP id r12-20020a19ac4c000000b004b52ef3fd2amr827346lfc.47.1675772777484;
        Tue, 07 Feb 2023 04:26:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772777; cv=none;
        d=google.com; s=arc-20160816;
        b=e2/IxGNqce66ONnJikTEvcQbynvtuvb83sl0pWTO3O2psnmcmdfWdfLcBwzBlxVHQ8
         dAO5QLx41C8G7rDJewcJl118xSLsFK6gU5S8ZB+dG1KUeel/VKBzNkDSXj5nazKgg6y2
         QigupypZ6f5hqSSyVYDIzz+P9xyB+rHGMqPN1pokOlMhAiu7vsauSe6R5n53WGVK2/jm
         uTudCuLizrpxHF35X96Liw2GQ5QTsjq0oyvi3z/Ue6ylr3xkTfWUhIqr2ni1RkvO3w/9
         PyNKVnr0LPAKzAVj49vK13y5bPbdKqxW0VFslyaVb5W6SYIxoylv+BrfHRKDMwfTMlkI
         p4rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=c27ArMTTTLhk42dsI810NSm5cNycF4kiZgaZC+c5+wo=;
        b=GJ4GX5MNGxp94QFLc9fJTAHHtH4xdEVu198nJj0pblRhOluWyl1sb6UmaGCdWUvO0/
         xj+5hzvfdNbJK/rxEThyY/BjyJytfJ0L/vZFZywdtjYhLoPgNJppLenak0m/dS2C1TEO
         F+mddQ2K7iGjXdjhkeW/XbNL6w1TmqKhbt4PMy/RSq6x4s182wR0DYbNLgRvevHxI/02
         dLZgXumVzNBAnbn1wUc9fifTzryuUquLxEY3zZUlk5mACeltiBcEELJw6K6SNw00KoOU
         abB6wG+VmzEkXwFfPyYuPGUpljzXjsLdSXiww2MR1ZKJcnR8E7VYiwV4wT7OWVp36l2V
         zdbg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id x23-20020ac24897000000b004d5786b729esi694593lfc.9.2023.02.07.04.26.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:17 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RX5Dznz107p;
	Tue,  7 Feb 2023 13:26:16 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 41/47] core: riscv: PLIC: remove workaround
Date: Tue,  7 Feb 2023 13:25:37 +0100
Message-Id: <20230207122543.1128638-42-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1900_1999 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_ALPHA_NEGATE 0, __SUBJ_STARTS_S_BRACKETS 0,
 __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

This bug went away with linux 6.0

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/plic.c | 32 ++++++--------------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/hypervisor/arch/riscv/plic.c b/hypervisor/arch/riscv/plic.c
index cb2c9069..2c820c96 100644
--- a/hypervisor/arch/riscv/plic.c
+++ b/hypervisor/arch/riscv/plic.c
@@ -226,8 +226,13 @@ static enum mmio_result plic_handle_prio(struct mmio_access *access)
 
 	irq = access->address / IRQCHIP_REG_SZ;
 
+	/*
+	 * When booting non-root Linux, it will set priorities of all IRQs.
+	 * Hence, simply ignore non-allowed writes instead of crashing the
+	 * cell.
+	 */
 	if (!irqchip_irq_in_cell(this_cell(), irq))
-		return MMIO_ERROR;
+		return MMIO_HANDLED;
 
 	/*
 	 * Maybe we can abandon this check. The cell should know the max
@@ -256,32 +261,7 @@ static enum mmio_result plic_handle_enable(struct mmio_access *access)
 			goto allowed;
 	}
 
-	/*
-	 * FIXME: Why does Linux read non-allowed ctxs? This seems to be an
-	 * actual bug in Linux. When we remove a CPU from Linux, and we later
-	 * change the affinity of the IRQ, then Linux will try to access
-	 * Contexts which it is not in charge of any longer. While Linux
-	 * disables IRQs, it does not adjust smp_affinities when removing CPUs.
-	 *
-	 * For the moment, and as a workaround, simply report any read as 0,
-	 * and forbid writes != 0.
-	 *
-	 * ... Okay, we really have a Linux bug here.
-	 *  (a) Linux doesn't remove the affinity from removed CPUs
-	 *  (b) Linux allows to set affinity to non-present CPUs
-	 *
-	 * Actually, we should always return MMIO_ERROR here.
-	 */
-
-#if 1
-	if (!access->is_write) {
-		access->value = 0;
-	} else if (access->value != 0)
-		return MMIO_ERROR;
-	return MMIO_HANDLED;
-#else
 	return MMIO_ERROR;
-#endif
 
 allowed:
 	/*
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-42-ralf.ramsauer%40oth-regensburg.de.
