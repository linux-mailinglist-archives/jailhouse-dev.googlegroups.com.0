Return-Path: <jailhouse-dev+bncBDJ7ZUWTT4DBB74Z7XYAKGQE5ETBENQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id DD90A13CB15
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 18:33:51 +0100 (CET)
Received: by mail-lf1-x140.google.com with SMTP id y4sf3394015lfg.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 09:33:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579109631; cv=pass;
        d=google.com; s=arc-20160816;
        b=JuCUKYQjchu5Lhn3Be/sZWgRMgO0uFlwLQVK3b1orfJWEwrcQy/ohakdhyH9dKIefU
         Wgt0rdoZeWD4+LTWwsD6rnQw5zonmxk3Bx9ublfpEhYj++iElpe4H+glORLuYMakoLkU
         SCykH5/5CK7z9O869eBzdgX6esrd78pmgYCzjCPBvdxgPzJ2TsX01mQphU/Dn1uIvnz7
         bM0aWixggY4qvuFj1A5g2j60Eq8DzKX6uGCQ4A6zo5bPKF7HJfQxada5BVEIa1ReRSgt
         MBbJ0sb8njfrN8TPngvNJwoKbPD6lBZFQfqpIUaGXmzv9ZZ3Ti6ljvHOTtA/MPOkHrTn
         POMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=G9Iqyubzs4j0RF+sIKoqYcv2R1E/BHyEVhTLaZrdMH8=;
        b=HADOUsA4Bwi3/zyYHh7Pbdb24w68RiuZPe0oirQfClorwbZwk4AYZoE+Rft35sCaa0
         rJ15WVwnh2aVMa7FTM/FkLFAEcZWKBkQi1AibLGWXL1VVQDqc8IznT7Jalfeyhsr4y4y
         F6Y4N7ruLsOXy7emvcUG2ykFsdP/67E5otmXaGKyynZzYJXWWKg8HDoF6WUq2sgCgy58
         8RF21bIC3joHozw1Ob7Omq34edSjX/cLoBla/pRNhxjrgvhYAAX08ru/t1ofaZDKetB7
         +ohqln3Xgk8lcnXz9JZsZl/DY4yMJnMIDwRLbZ2rA1I2NW0FF7QlU+UjRGxnYk0Lu1h3
         xjwA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of chase.conklin@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=chase.conklin@arm.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=G9Iqyubzs4j0RF+sIKoqYcv2R1E/BHyEVhTLaZrdMH8=;
        b=q2emip+4fYrcvn9WeXNSoWBtJb2M/b4gXabvpL40XuWfCgALV32fgILd2gBC3Kw9cG
         roQfVlK/oCcF9pL4qDdqx3/MvT7qkW7NsSrmb273AuZVRAKRLSz28CGsMoT6rS5Zkwhj
         Ayd5Vngw0VeiGY+WuoMta0KwfQjCiZxfKRlbfz4ELYbLhBtBFNBQ/d3vA02pnrRIpZ/s
         E/rmQE117uvy66GXMbI9oNsi26rbnZxb+Kq3toUuOunJT9EiTMO98dPJ3aJUApTNV/9r
         fzIxZXIwCwXLFwDB8Yk1GNGGXhv6CmJzDFKByw2a1ISb3CnM7hleoCxYY33nH2L0AUxF
         5fhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=G9Iqyubzs4j0RF+sIKoqYcv2R1E/BHyEVhTLaZrdMH8=;
        b=evzA2WatK60knAkP/Wqf0YbeEAbYB9ourQ2SuUm/+PBWBX05ypXzudxCZ1tUp8DQq3
         UaMjZT4/cVMp7YXyKNEZ8iG0l3TDGz7zhu++JX0kkV3jqcplb5tGp4TLS53AY3aIcNyN
         1+O0oTy5yYv3aN0FOI9ME+H8KcLMJcMXDWBC3yePnQc3SPPgVcXhs/4PwoLUSLaaSgQ9
         0N4tCt2Vh9IyagLxTrfykWWAkqa0Qv/dPqPM+Yiit+PpQ7ajzX8eaXpZE66isF/2Hv7m
         yacER1u9F9gIYx5iIhxox2zSsME8CA/cvlfnYF57bl9Juxl4k3iEfMt+iPgbOA0clXkE
         jJvQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXpN/W21ruTJzeKg1JieBO0pBt+sLUelPn5/QuISD4iKbBoRjMF
	5BEU68QTbevITMxu+1xBins=
X-Google-Smtp-Source: APXvYqxggyGwUItlsV+H26GMWrsf70OswPYC1Q9uCp0mO/k7TZxUE6ja8OfFjwVk6lCVOzIJz2neFA==
X-Received: by 2002:ac2:555c:: with SMTP id l28mr18074lfk.52.1579109631420;
        Wed, 15 Jan 2020 09:33:51 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4acf:: with SMTP id m15ls1890077lfp.13.gmail; Wed, 15
 Jan 2020 09:33:50 -0800 (PST)
X-Received: by 2002:a19:f619:: with SMTP id x25mr7125lfe.146.1579109630754;
        Wed, 15 Jan 2020 09:33:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579109630; cv=none;
        d=google.com; s=arc-20160816;
        b=qncJCmDAqbu+VJWPRCfn6l2Tfx7HYE5h8ifbCtQWyKAmxxaFA05XAsftshZXzEsp7T
         7YtPm+xj4OYuRWWfhXGJ2vwV9I9c/6VEGT8fbDMkzCJ3Edy/fg+rl5SvohENsyjsD0jy
         zjgrRFbL5IXHYSyWE2W5EF1IH9Q7v0nIDKZGoCrwWw+jKTpI3Orfl6Ks0uxMmUPUlA9l
         tcql4g9m7AazewpDmqPLLtuOuqWTJD74gcA7sDcoJhj4eZVsgXJA9dnYKiFuIUNGyoZm
         qAFpgDnqwUzG65qOy57KT2x1qNnf0OqgL2Hq1i8rQOdXDrqoTHoHq+lFzZlDrm6aAKTJ
         wnJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=k9+aISwqRjfN3fjU9fq6AZafBT6+YZeOMQVRh+v9zjg=;
        b=kdhAazo/eWGmgmaaAJcVFRMtLwlAew3M00qAVoDoQyfkKE/nbrmG+5zxg2gt78ZzL8
         IZ5erdy1Q10C+epARzaZiLXIjheZyT3fjwp9l2GrkcM3j+G7QV3MqWXWtCM81dx4ZUxs
         Idp4QU+Bw7it+/93uW+xM5PKZ4GqJ2mTFIElCz/MfSDfheZghYQ3trFWwRurlp/7g/UF
         5jGxodRk5+1ME0vqslU3de4RYRKqxSRRTNfHRKIzzoyulhcRF7z9l+qsN0aYXoYTZ4Rk
         7CilmE71mWtKB1vfD12MhtPLu8OJsF8B4v1U3JGiY3ltXPK+gU/4Hs7tmnIiKOmxybvz
         XAgg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of chase.conklin@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=chase.conklin@arm.com
Received: from foss.arm.com (foss.arm.com. [217.140.110.172])
        by gmr-mx.google.com with ESMTP id h8si877969ljj.3.2020.01.15.09.33.50
        for <jailhouse-dev@googlegroups.com>;
        Wed, 15 Jan 2020 09:33:50 -0800 (PST)
Received-SPF: pass (google.com: domain of chase.conklin@arm.com designates 217.140.110.172 as permitted sender) client-ip=217.140.110.172;
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02561328;
	Wed, 15 Jan 2020 09:33:50 -0800 (PST)
Received: from C02TM06ZHF1T.austin.arm.com (C02TM06ZHF1T.austin.arm.com [10.118.111.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC5423F6C4;
	Wed, 15 Jan 2020 09:33:49 -0800 (PST)
From: Chase Conklin <chase.conklin@arm.com>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@web.de,
	Chase Conklin <chase.conklin@arm.com>
Subject: [PATCH] arm-common: gic-v3: ensure LR writes are visible
Date: Wed, 15 Jan 2020 11:33:39 -0600
Message-Id: <20200115173339.3317-1-chase.conklin@arm.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Original-Sender: chase.conklin@arm.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of chase.conklin@arm.com designates 217.140.110.172 as
 permitted sender) smtp.mailfrom=chase.conklin@arm.com
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

The GICv3 architecture does not guarantee that writes to the list
registers are self-synchronizing. As a result, it is possible for a
valid interrupt to be written into a list register but have the empty
list register status register report that list register as not holding
a valid interrupt. Since the empty list register status registers are
used to indicate which list registers can be used to inject an
interrupt to a cell, it is possible for a valid list register entry to
be overwritten, dropping the corresponding interrupt.

Fixes: 2ce9d14ca4e2 ("arm: GICv3 initialisation")
Signed-off-by: Chase Conklin <chase.conklin@arm.com>
---
 hypervisor/arch/arm-common/gic-v3.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hypervisor/arch/arm-common/gic-v3.c b/hypervisor/arch/arm-common/gic-v3.c
index 906d9a8d..6a1d90f8 100644
--- a/hypervisor/arch/arm-common/gic-v3.c
+++ b/hypervisor/arch/arm-common/gic-v3.c
@@ -113,6 +113,12 @@ static void gicv3_write_lr(unsigned int reg, u64 val)
 	__WRITE_LR8_15(7)
 #undef __WRITE_LR8_15
 	}
+
+	/*
+	 * Ensure the write to the LR is visible to the GIC (so that ICH_ELRSR
+	 * is updated to indicate that the just-written LR is no longer empty)
+	 */
+	isb();
 }
 
 static int gicv3_init(void)
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200115173339.3317-1-chase.conklin%40arm.com.
