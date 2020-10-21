Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBIMXYH6AKGQEHMCHMUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF85294F32
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 16:54:25 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id dm20sf1584258edb.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 07:54:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603292065; cv=pass;
        d=google.com; s=arc-20160816;
        b=bsiySMG34bg+VbNEIkW666Y03AjB7nlAQ+xUpVUBbDRfglfpuDw1iX0UwQg2kPMbcQ
         jQ9Z708R/eAcMQ7vNUwawP0RFroVY5HuW4h67oAOd7KBUWoAp2MPL6w1eayPLZWTWu6I
         MAqzogIJdgvUohOvc20O79ztbW82m/+cjY1ojzhyi2usq/G5YV+w7APiwPoWjS9oC+/X
         JVrBnLsNRBy0U1SMVrgmLVy5I8kZa41Hh3ak0AcE21CURFqMVktpvTXO5xYKqabgPDeN
         62hsj+HpnIEUK9nCHA2VbHGditmcKNpPx0jOpvX9Hf3W0++oD/vcNz3g7xfD/M3c5Ed+
         lvWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=G1rST+9UlunvqjP5Th1fZk+MZOsV2zFSQAZdM1wRyuM=;
        b=B0X3CSzocEBwuSzEQZOvhHcKaKYE0AkRqFwghkkmu0WVcd0Z3fLc8awWxW1kwrEwZz
         qjMCwBWnqpXpuSz+afkhoZvPFSSwCXeoaqR8A6dJIIU99pTktTIJNHObsL5bQNCAoSpd
         NrR2vHH3U9fF7tc9+LNxIPeXrKcgwpqKkh7Rq068Xd6A2Bg9fSpIh996/Rqo3bDNjIwz
         pEM14tTmMOLZbCvhOUscUCETICSXiBHZR4it7GxhuuDPTti6feBRw+OD26NXLwxkLwIp
         HfoKyv0QMYr9NtpUymMsM4bMtF/HJnhvpcG30Jc9nCMmMhBjfjdH7rXfgdD2Jw9LD26S
         Ilyw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=aZSPLdEs;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=G1rST+9UlunvqjP5Th1fZk+MZOsV2zFSQAZdM1wRyuM=;
        b=kjTfsP8D/4gbPoGZk7XPlAmZXLKxtEKhVXjmlifLooaw3PRWVeaZG/Dzz5DxVu3JOq
         yGSaCMOjazopwz4TIVveOIbLC5c85OviVK8g81sCrO6J4cKA10KKe6aanlE6Z1uwOcxK
         N0S1dXx9P3WdBDTy8Nail8ldv3xRr5jP7U1ULSDwmVAV7ZHPZI0hhfsjAow4YyEV2vT8
         CuXbJ/LW3+kDZ1ZqZlqiro8XGvr/vXFCnDJKhUwxssS6q4tuz6v1EOHeOIBUyRTGCIWk
         u5SaTXMHJTMtB6NuTX6f93zQmOpqZSKiZz9MgbPp9LATHUiIA1RsWVl2DVyGKE/D6ux4
         dhFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=G1rST+9UlunvqjP5Th1fZk+MZOsV2zFSQAZdM1wRyuM=;
        b=ccfiiykskZJmzyypRuR8WmAQpSgnTCFWushos9vzeBU7vGEQg7xQ7mO120kKPL9+YR
         mqCeexgkseOmO4zaOY0kvF7uSnU/knDhYpJv4DoOoBqTXmc7frSHh84YGMI+1gYeeQ/T
         MSJqRIQW2qr6+XRtqfzBLCVjnjyxHK0Cezd1ZFaqvPfW1BwzuGFU/eLiVL6825WW2OZN
         t1ILTaqXwaj+nQKupWbqUTqJQXa7Ze9YjRamNniu66kg3FAxcJy+dxjUeDgbdJ4/H0Bp
         lnQ3Fs0kn5Jj6IlIH92opQ5VA2afT7MK3F4Kcs/C4AV3QDZBDxgsZDoykTK41DcUllP4
         azgA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530WxGGpJ5ZM+T2ttU+h16BM/07KDbrGfrrgFAqakFy1Jz9EnIcK
	WlaWXRFHqdLu53ONe4oZEA0=
X-Google-Smtp-Source: ABdhPJyM7jKNGAuXH1bRMjwNzdvuaWhIyla1K/C8q/XlFqa248/KkLDP6fC32eQy/K7/HX+Tl2ivsA==
X-Received: by 2002:a17:906:a8b:: with SMTP id y11mr3865872ejf.302.1603292065323;
        Wed, 21 Oct 2020 07:54:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:1c02:: with SMTP id k2ls2886134ejg.10.gmail; Wed, 21
 Oct 2020 07:54:24 -0700 (PDT)
X-Received: by 2002:a17:906:a289:: with SMTP id i9mr3998625ejz.193.1603292058364;
        Wed, 21 Oct 2020 07:54:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603292058; cv=none;
        d=google.com; s=arc-20160816;
        b=tA6fudBaUQ3/WVeuVxIeA/UmxBNVWjP5Fs3EzeioURrqkBwJDJ1mOOW7VTYN6QJvhS
         PqmNx+MYobzhX78HUEhYy67W8SiCxQ/LJ/5kxEpnS0b26PUIveyeGIF3G8IV7kpHrw5N
         McrBrXCqWvCNWgLfYGXSkTuBXkmgTZ888zib99jVxmA4fvxbV84uBeGhE4wWJZt7QREX
         rsdKBLOrJ4Tx8tyubTnR3dxSEZTuPMFEoIajdBuvJpChjVycsvCJflr164/sDniXUAED
         0rsTXd9b7oIK/v6CJQ9DdrivIbWBDIKuYjOgjytNuQGhCI8Wy1R7kdiFOKq4tsbA5R4m
         WbBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=hCjGy51FKTLX8zJZekyB9McVszk10EWd9jpptNeijBs=;
        b=Qv+8AZEySwECuUAdFGnRWFyYCWEMWGBkSkmlUfLkPQ3kWff8ZF7B2A7eTFtnAqByUZ
         wsBX0kSKZZNpkyL/TYL/2k/tBtUDUKFkN/Ep50LlQLk16ntybTUXeyWeDsyQ8hjM7UTB
         GhZpL5hJInF+YHsy8xlAHSFqJoqy/X6xvbMCpt/znh2oWRhEQXIu92JM6io4di7L4kb/
         FkeEEW99qRg5gWrqwnwn3yCWeppLQUK3j7ibq6u0qW+j24Xy4kdlJ1DHudyW+irmnrUO
         A8l526W7ZqRhjRTQFRL3zM/D10M2DPuQ53BrCCgLNupMZzw+ybJyrKHvSbbQgw0B6n/9
         GZIg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=aZSPLdEs;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id dp11si21468ejc.1.2020.10.21.07.54.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 07:54:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGYRY72lXzyRN
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:17 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_TO_SHORT=0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id DHyOYBMN4cIQ for <jailhouse-dev@googlegroups.com>;
	Wed, 21 Oct 2020 16:54:17 +0200 (CEST)
Received: from kabal.tum.de (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGYRY3KSqzyWr
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:17 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 15/26] x86: apic: Wsign-compare change to uint and update comparison check accordingly
Date: Wed, 21 Oct 2020 16:53:53 +0200
Message-Id: <20201021145404.100463-16-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021145404.100463-1-andrea.bastoni@tum.de>
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=aZSPLdEs;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/x86/apic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c
index d36c2033..b49a6745 100644
--- a/hypervisor/arch/x86/apic.c
+++ b/hypervisor/arch/x86/apic.c
@@ -315,7 +315,7 @@ void apic_clear(void)
 {
 	unsigned int maxlvt = (apic_ops.read(APIC_REG_LVR) >> 16) & 0xff;
 	unsigned int xlc = (apic_ext_features() >> 16) & 0xff;
-	int n;
+	unsigned int n;
 
 	/* Enable the APIC - the cell may have turned it off */
 	apic_ops.write(APIC_REG_SVR, APIC_SVR_ENABLE_APIC | 0xff);
@@ -336,7 +336,7 @@ void apic_clear(void)
 
 	/* Clear ISR. This is done in reverse direction as EOI
 	 * clears highest-priority interrupt ISR bit. */
-	for (n = APIC_NUM_INT_REGS-1; n >= 0; n--)
+	for (n = APIC_NUM_INT_REGS-1; n != 0; n--)
 		while (apic_ops.read(APIC_REG_ISR0 + n) != 0)
 			apic_ops.write(APIC_REG_EOI, APIC_EOI_ACK);
 
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201021145404.100463-16-andrea.bastoni%40tum.de.
