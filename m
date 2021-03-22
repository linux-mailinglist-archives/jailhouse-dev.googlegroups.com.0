Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBIHH4OBAMGQEK6G7DSI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DD0345020
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 20:44:32 +0100 (CET)
Received: by mail-wr1-x43a.google.com with SMTP id 9sf11053865wrb.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 12:44:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616442272; cv=pass;
        d=google.com; s=arc-20160816;
        b=fCfbymaTBR24jnt3kuib6nwovUxpmTLiytEN5Rxc5Ima+fB03nkhft4c5mJer9Ljpt
         NrxnYxXtbfJVzGoGeMbEurTiG4WOra6Vg5hAYNF7wT4UGD4BtyO6ILm1J925K6SeWJFH
         Zuj98SsLe9jX4p4lW3yDM8xsXB60rux4/fWrOFpdImmafH5Uuf2MM21q5dx20KCpmVni
         gc8DkyffvM1FP8dlyhJ+rERc0b6V6EdiNAcX7OrDXeNh6Qv2NEcoHsAy8Y+g9GeKMFwZ
         +74VBjSJFthkpOP39Qep+6ZZJl3JEo2yboMpMgJ9BUc1KdzqkIK2hpI5biwI1zYaf3CX
         OBgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=WKDV9w88DknioeDLOYnXmuD5JvXdOno44Lp8CRTWZgE=;
        b=dKq37t1QN4aR+Z2deHGd1zYT1IzRq2qsKeECe0SHp/Rg6gu4jBlfRKnAS8AigI9xf+
         vt//u6yCA2zs1RhH66N10Qm9fbnrlCxw9clrLc9SYlZjd3qIj70ikuSZiSOY/qk3daHF
         0gJKVAVkWnWIoP7O3BxjSlysEDODMkWuxaqP+xRZwb9Cnbp1kAqgMDHS9bM0ZpGo5A2w
         inywwNpGqVlDCYeFU1NTVKPt3ePlCaxYzxYTcObpB7LYUV8cInmxsjYOkY79PFu4mKT/
         YqTKeb3xOPXCH61/k7GesNkLq3Sm9SjbBkXOpXBKlYGAzLKyo8oIJxPqsMDH81xS4F2c
         kFrA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=IiGHtoqt;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WKDV9w88DknioeDLOYnXmuD5JvXdOno44Lp8CRTWZgE=;
        b=mrb9f7i6BcA95kMAdiCP5b4pPSjpd4ly/fnRMGfVgqZnE3mdBiha6CEoHQyWtz7ezB
         Oo1r0orqHl0f/dK/WeuFhvoDvemz7G7I85ari8O+58TAw+Iy0W4w7mOaQZ4utRQitALx
         YbgI4GYunc+RpoXWxFt0T+QxZuIjg2Fbni4qT//8ir/wBvJKlTixg9rsXt8u+k3n8V4a
         WWkGkicLO//MjJYKPnrxgx5f8KsO2xMB360Cy/wXgjLRw57kPZ+IQm6dPLn4cd5XpqkD
         9zmGtY/a6B4UxEx6bUUMkUN4L9li2/LTUOl0AoM+VkjVUFrK9ZCaTRIff08xkhOtgZA2
         7zFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WKDV9w88DknioeDLOYnXmuD5JvXdOno44Lp8CRTWZgE=;
        b=GXmmwB24fjZUFTckK692ySZ0aFS7A2O8v/mXOIeW0zGs3qWX2qIXZPXq919WrRHE61
         2Z0Zwcs1DKemNezFyM29mBckcY2YHe5oXim0M7bGUq6tSDEPcOxu0XtgQ7NxKuKqEaGo
         6ETAsUDkSiDOsDyc1qwaPB7JaGbwm1vCQUEdjFLrM1zIF+OjZ767aW9gAlbBf/Se1cMN
         LtpU0lYiN8VypZYjT4dLPqESO5/416q8JqnsxsX13iyPbdcuWNWdJS105yUcYwF8h9bD
         IvrdNqpfjMQkXWaR7nFZkoMO1D5bB/SVmNHQMFQp8OClmB3GKRuRg2XTwLsPYmdHzwEC
         X2uA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532bGBHN9T+cCBKhgau5Ccu/9lK1bclMvgK2kuO6aE0VTldKW2fJ
	WuqogDWriRpyY8DHRriGtmg=
X-Google-Smtp-Source: ABdhPJx0qcS3Ykndu+rHkP8KwEB0ts9Bxyurtrt7U2WBbMNL8NTq6Lg+GAMKg88fXaQVUmYR8Edj2g==
X-Received: by 2002:a5d:4ecf:: with SMTP id s15mr220588wrv.222.1616442272363;
        Mon, 22 Mar 2021 12:44:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:bd84:: with SMTP id n126ls182402wmf.2.canary-gmail; Mon,
 22 Mar 2021 12:44:31 -0700 (PDT)
X-Received: by 2002:a1c:1f4c:: with SMTP id f73mr81184wmf.25.1616442271452;
        Mon, 22 Mar 2021 12:44:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616442271; cv=none;
        d=google.com; s=arc-20160816;
        b=yNGaIrlq6nLW5iH6LYn4zgBK3MilOb1T6UhEjm/UCp9TVvDyvCyYG4ecfAiu0a2oOh
         1/efbEZ7VPm9wD845dMefoaEneub+I3/Y6lFJai+lwdaVb0TdA8Q4+wviKSIEpVxJ5Ox
         HrZ8WBqWHNPN+tIAOBEIcBJeWMBgikWuO3Vqh06wg2RkaZ9PoUwQ1OTnvlJremB7VO6V
         bKCYONuLJ0jmXuoncfr72Jd3i9Me/dFRFfo4WMetKTb4nnNT1GUuVwWhOo+tndgoKrsq
         7A6O5lQyNVtQE5l26L0FcW84OPPmi0g29NNbgHAPZ3159iAhu9SVkzqpyeub48LasuSA
         r1DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XjhtRDJVbg4Rs8FxaxFsyyuzCQZxSid6528O5JdWTPI=;
        b=eoDR7lFo/1qWBXpFGd5xVdy4V6FcIQug6MTxEocbAWdm3pRWGZKZbp1JyqZcH1ziz1
         MXQ/bAqtzK6WySHHCCwCYZZlUl9gpkaGGGZnvUqh3NN/P56JSJXrEO/5K9gb+L7vJ/7P
         SFRCUROv2eQ1RsbH/qK6FcArmRkgtyiA5C3kV0A0Rub9nML1rFRM1Geulxv1HzWLeaQb
         o7iXQ/Qp7jP8msHSghaR9UoNYk+cus4jH2fdOSvMVMZo5xkyFc08USBJl0lZGpeP1nAR
         UrP5Gzz0N2fyVopdQ9IeM7TgqSl6OGaBowJPl44+xRaCObcxtze4u3D99LZ00/O2XVE2
         tgbQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=IiGHtoqt;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id p65si43595wmp.0.2021.03.22.12.44.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 12:44:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4F44hH1mfPzyXW;
	Mon, 22 Mar 2021 20:44:31 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.878
X-Spam-Level: 
X-Spam-Status: No, score=-2.878 tagged_above=-999 required=5
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
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id GuB_yY2scy_a; Mon, 22 Mar 2021 20:44:31 +0100 (CET)
Received: from kabal.lan (ip5f5ac6b3.dynamic.kabel-deutschland.de [95.90.198.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4F44hG4jvBzyWm;
	Mon, 22 Mar 2021 20:44:30 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v2.1 1/9] arm-common: bitops: add most-significant-bit operation
Date: Mon, 22 Mar 2021 20:44:02 +0100
Message-Id: <20210322194411.82520-2-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322194411.82520-1-andrea.bastoni@tum.de>
References: <20210322194411.82520-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=IiGHtoqt;       spf=pass
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
 hypervisor/arch/arm-common/include/asm/bitops.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hypervisor/arch/arm-common/include/asm/bitops.h b/hypervisor/arch/arm-common/include/asm/bitops.h
index 808c9a0f..e099b560 100644
--- a/hypervisor/arch/arm-common/include/asm/bitops.h
+++ b/hypervisor/arch/arm-common/include/asm/bitops.h
@@ -31,6 +31,7 @@ static inline unsigned long clz(unsigned long word)
 /* Returns the position of the least significant 1, MSB=31, LSB=0*/
 static inline unsigned long ffsl(unsigned long word)
 {
+	// FIXME: the ffsl on x86 isn't robust.
 	if (!word)
 		return 0;
 	asm volatile ("rbit %0, %0" : "+r" (word));
@@ -41,3 +42,12 @@ static inline unsigned long ffzl(unsigned long word)
 {
 	return ffsl(~word);
 }
+
+static inline unsigned long msbl(unsigned long word)
+{
+#if BITS_PER_LONG == 64
+	return 63 - clz(word);
+#else
+	return 31 - clz(word);
+#endif
+}
-- 
2.30.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210322194411.82520-2-andrea.bastoni%40tum.de.
