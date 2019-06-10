Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBLVN7DTQKGQEEGPSRBI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x538.google.com (mail-pg1-x538.google.com [IPv6:2607:f8b0:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D453B0CC
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jun 2019 10:37:04 +0200 (CEST)
Received: by mail-pg1-x538.google.com with SMTP id w31sf6454178pgk.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jun 2019 01:37:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560155822; cv=pass;
        d=google.com; s=arc-20160816;
        b=Z5Cm85wvWLbASRjgLDOroC1Ub14DbSHSlLMMADEXUodn499lR7vpIyg5zYThYLIT78
         oMT9xj5vBT5Sl2IV/rvrLgN5xolv5IkCt0ZgCyUAs03WsgroW+7o168AD0z0057lGiXk
         oCTOv/U6UYOgZUGtE7IDDHAYUTI0KL60vrsGlT6HJLnWF1aFVc8ipWFGJGGgK0Zg0NMl
         kbX9JZRdb/pEEn0thGOdDf6qmxTUr0ue+o2Pg/G+H3i3qdMmp3l6kg9XXdbNtZ5EZ0pT
         HIrm4CY+nFCPhG7A2OJyIB7OsFdc7fvyFEKsGyY45uK777ILLhxupJxLd1+EsrJbNZp6
         es+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=Hrrh2m3V11pHvFpVKqXIFvoLODhP2yZvPz0ie2POsDU=;
        b=ouTn/Pi0ST+fVRPx5nPTQH7PTonzs0BDqw3hEltC6FmxooD332B7qrEN9vPF1DbzaB
         syosoKN7d4GfuR4ndKINhs/e/yMKsK5cvouK11exOfC4hsPhEv9B47CETfW0MqQKPeUM
         YOXyTupDx+plGhYhzP6UHgkvFpiAP0WOaQ4VhAscRILfgiQOJyDI4DBAn7O7fRPuJVMv
         BK0AIFBF05DNmIxMVgS+kfJxqMp61KaBkwbWWnQAXdYytYLmNHVtOHUIbKSsrdHeyvht
         DBHOAnDnPx54NlAxbUl6ISFxNKjCi68E3L29II+YO797SJk8XNIokOSkbnH7VWY8a0px
         hsig==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=RVaSJtyh;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Hrrh2m3V11pHvFpVKqXIFvoLODhP2yZvPz0ie2POsDU=;
        b=qkgKuRcFE4QaJxbtjTEJ8eeEqtRnDDf8M9C5qYVXLfF/5VyPDD6j1jdnCY44xaZDP4
         rMVc9ITXccFj+7sfAmi/0B3/QWQrhJUyKSkaiDsEWc8hPjVK9trWnH2zjNlXw01/I5P/
         /tsuJSyeKBobhQkdqtgf1l16j1Z09xk5apiPqHi7PxqoxoegcMDPVVddCQUEHVP9wyh7
         pE5WFi9uwT/FTE6FrxpIlmi3Mn6ZS/aw2fvSig3JWVr2IE9veTqbw2V005Uv0WelFRoM
         9xig+u4s6hdWANBpxPtBsLpatx4DbPYU824TvpoHdf6DJnND4PfbUzv5yNOcjrUK8mFY
         BslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Hrrh2m3V11pHvFpVKqXIFvoLODhP2yZvPz0ie2POsDU=;
        b=rLSVIrl8xTw7L2CUlEis2PjTWtuqlUsZImN4tQv5Pf6mRnuSj1AUn8ileMC7aUlnJb
         mR8Q/tRNqYM0xZZcsg/dpUBWwzvENELyeKCmPfjIkP5893aVfNA6N+GVNtVl/w1ENmlH
         1LZwEYF/jLlCY5yFIO8yMETPoROkaaCf9oOeoVPlP3gaTlBlTeQgCd2eHej/BjCM1it2
         laggw68SOB7sEkGfJUJaG5d3x49wlgZXOhh6emymsl5vxBgowEyIXKgA6TLr2L3u+e6h
         u6bLvXk6eYeISVat+W/n8MtXjhyM8+V9w8WYLymoLxFQcb0yQfg1QFP/fMTSBl9Xx4Cy
         D8ow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWCQKZ2IbgmdAUyNgbHUHSdoTPQCIIYYwaAKk5eba/yFMaFKLhR
	ly+v9M488ehsaoQKuu/uxYM=
X-Google-Smtp-Source: APXvYqw4YWSHnFKZSrFzwi2EbD21tX2veVGwThY7Z30nUfAJd9zX62DwMjSvz2oaNaSu0ufCR6TOPA==
X-Received: by 2002:a17:902:868f:: with SMTP id g15mr68921102plo.67.1560155822290;
        Mon, 10 Jun 2019 01:37:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:868b:: with SMTP id g11ls3830752plo.15.gmail; Mon,
 10 Jun 2019 01:37:01 -0700 (PDT)
X-Received: by 2002:a17:902:7083:: with SMTP id z3mr4856420plk.205.1560155821765;
        Mon, 10 Jun 2019 01:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560155821; cv=none;
        d=google.com; s=arc-20160816;
        b=LLaXXkmw9pbifgsPN6ofNp2YvB91MLnYZAczRotf+YYRkDvOi4E23IIU3L/wZfj4NB
         TrCVJl7p6kmy77TO7jz1PBnB/8svmZxe44K5gkMdG/YIpD7CMdGcLTv4kpfrUlNzMoV2
         pl/z9HkHyOcTIQyOdpC0+RN7cB5xghGsQEOFw8H+UgteQtiheUJ0ghC/NDFltcpdp+nC
         W1i3YFh6ixJ55Err/J2CIVV942sRz3c/CBrs81ENAovqplQrM5Z73I5EMzKDWbbjWFfQ
         V1EdaMj4ua1sF5RuFHcA+EmzBlPya+tmo1Y7WyctufPk8QAYCmYL+2BW/ZOY5m6Fv9aM
         9N7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=zJ7+HrAE5wRrNMQl1N+rwdDFc19782HYJcYRLaA4zGg=;
        b=ZVkKYGodiuvvM2e7wz0mSRteBXyEz++P1WaHujxq0CleiT+Fo0FPvdWJHJJwXZSSNp
         DZUJZ2SLArF6iZaNdTh7ExT9gqrm1j/r1wD/65c9iji2HdLWOoT9CxU17QENJpsQBeU3
         cio1SPLJpXSx3el8IOYY+X8jq/lRqD7aRalRCq1QZnjOgH3XhTBVKxwIZRqjg+a6kv1j
         DjW4Mue054vVGvLilYhh5yHshrV+F9Hvj1KEkv57JEOdhxN54Cnc3bPNMRvt5JqIQv5V
         UmogbA5O5rX05PYhrxVBI7Uhe84E46bv3/BCPBUOXgXlprSUwTg+X8RtRNC1ODKThtfr
         U/Yg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=RVaSJtyh;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-1.smtp.github.com (out-1.smtp.github.com. [192.30.252.192])
        by gmr-mx.google.com with ESMTPS id f184si370790pfb.0.2019.06.10.01.37.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 01:37:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) client-ip=192.30.252.192;
Date: Mon, 10 Jun 2019 01:37:00 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/961576-7c0d29@github.com>
Subject: [siemens/jailhouse] 6e27d3: arm: Account for non-compliant
 PSCI_VERSION return...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=RVaSJtyh;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.192 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=github.com
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: 6e27d3af3557c8d1bca5423aee32e828cca567c0
      https://github.com/siemens/jailhouse/commit/6e27d3af3557c8d1bca5423aee32e828cca567c0
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-06-10 (Mon, 10 Jun 2019)

  Changed paths:
    M hypervisor/arch/arm-common/smccc.c

  Log Message:
  -----------
  arm: Account for non-compliant PSCI_VERSION return codes

U-Boot returns PSCI_NOT_SUPPORTED, rather than the implemented 0.2. This
is practically harmless as the succeeding PSCI 1.0 call will then fail,
but it is cleaner to filter out all negative return codes.

Fixes: ea924a3fec98 ("arm64: Initialise SMCCC backend")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Tested-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>


  Commit: 7c0d292ba15aeaea482be984f9082143fd2bb275
      https://github.com/siemens/jailhouse/commit/7c0d292ba15aeaea482be984f9082143fd2bb275
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-06-10 (Mon, 10 Jun 2019)

  Changed paths:
    M configs/arm/orangepi0.c

  Log Message:
  -----------
  configs: orangepi0: Keep hypervisor away from "secure" memory

U-Boot places its PSCI EL3 code at 0x4ffbb000, and Jailhouse so far
overwrote this during enabling - because it was not secured. This
slipped through widely unnoticed as long as no one tried physical
CPU offline/online after Jailhouse ran. But since we implemented Spectre
mitigation, we started to query the firmware - and crashed. Avoid this
by keeping some safe gap to the firmware, reducing the hypervisor memory
by 320K.

Fixes: MiniDebConf 2019 live demo
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/96157677dfbb...7c0d292ba15a

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/961576-7c0d29%40github.com.
For more options, visit https://groups.google.com/d/optout.
