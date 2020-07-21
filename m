Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7UP3L4AKGQEFFHDN7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BD82278B9
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 08:15:26 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id l4sf4881905ljc.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jul 2020 23:15:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595312126; cv=pass;
        d=google.com; s=arc-20160816;
        b=veLC1ZVGF7AHEkI+ew+CAhqxOZQ1PirFLGugTcQEjHm8FiOTx8dqQpMAhATzA2HXEU
         VFnKd1VhdI4taZ2m+ias9YIo/Up9EbH1E9YtMQh5ZLaSkL5ev3kYvKSYUH8OMezOeNPN
         htN23Tt7CTU9NZUtKaqDWCMmdmo6DgZciFo88kxVwqtihph/mBBVSPnAtm00LT3dOzfJ
         +kKnGM8mYGQZlgqEnKv7deNNYpapUUbKb+vcsXgwtEvcgY1TW6djBnjSdf6w49wVVicV
         8DGl9ZLX9PdDDCjAySt+MxpLIwt8IEo+tuWmDdvFKFT0x+mwC5ovWXOFsbzAh9H8WTBH
         MhxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=D3Ujj1UmQlTNlkMUKBK2hB5E46QvG6ELnfbqNjPPDwI=;
        b=01XsZhSm+vZhwJ1S/oqsVAJdc5CLrnDqNvVwvpJ07xofCUMCjLDxDptrKrVCjO25r6
         WCg5ZjDawJhpgxPhHipSPqTXKinwmSNtg4Op3MM413hygKxoWz2SMJu80wWv0Zbp0R28
         Jv1x/KuMRzNLzhJsOGV9jrm/YvNhXO/71WfmYxCaF2BKyWDD7ZZ+v0xxQUnQ9QKHFuzO
         pV7ER+m2DEUpmwZBM077cfrkIAeZMU6Vm5Y5lktitkgpidOpcs27IW90mlhcGNR1DfF/
         xO30pZHEs49ZxjDpd8gDbLWxX1vUHeUnRI603SerMJHQE8hMLye7g24vnJ4Zwtb+S+nu
         vprg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=D3Ujj1UmQlTNlkMUKBK2hB5E46QvG6ELnfbqNjPPDwI=;
        b=AskP8sGpBoo34UEne5mZdEwW2fJV9JezcxHWYV/R+IVWACHXN38wbcVWNBtUsUjXqa
         6I7GGxZfDttaFT5wBxnri4nmw5LWvJLR7rwf7heHhzPUk7iHlN3RZo5s1xCEE+MDLEdJ
         TtZeaGUUzC2FDUScWWzDyMn97cLN5hkjFpGlZisrUSCUe8kFfQKcfaMXMuzJbhLaQa1b
         E6FBkx1gOXflQBGKSXN2Tp68AoXgiD780ckUE8CIbRTXQqHpibzGLroHxocYW8socfvO
         BNaxvYeyu8pP/PqYzDRbM7cJvUBggBxG8c09+QQgC656D6jsGgIuriUW8mXQ4v296MZ5
         kVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=D3Ujj1UmQlTNlkMUKBK2hB5E46QvG6ELnfbqNjPPDwI=;
        b=rCh0H1cU0RMjU/UprzBNVCcThHSQYI+cVJmEUX0WvA4F4ezc0hfblqvOKn0SD/GqOr
         swc/x4Kr3tNwYWyPDzW8NlWnAd6lIhEsTI7cUrzIJd0ddBKD8EUBO1jTcywFhlzpHxEJ
         5iZIbDO83Jphhn93SC9fX902BEvzo2HKi0W/Un5ziVsDIo8AvG2p/iTQBmkcqdomz3Qn
         /6YyVNNBfR/SPpZ8FP0bWGu12NM4o1ZvOhzBFV6xfuxFusg0ym+hrlmWLmV4fperxnk8
         yRXckUm+HIaQAuo4PEwXkXy5VewcSp+cUqwbOOwe3w+z1TLD+n5UFKnZ4XzuXMBTamqW
         tbuA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530GzF1389YYSoya12U2QPdidPzKUutnxzbMH/mTwp/aqcbnsogy
	QhJx1+2hefILPtwNc01QUww=
X-Google-Smtp-Source: ABdhPJyprJiJSlGOoqWEiyCvxQNKnmFBNc+rjqXVCZacdghE/Yp18QzM5I1MtfXtm1/m4EoePMoGdA==
X-Received: by 2002:a19:7e09:: with SMTP id z9mr12528321lfc.69.1595312126283;
        Mon, 20 Jul 2020 23:15:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:230:: with SMTP id z16ls3082425ljn.4.gmail; Mon, 20
 Jul 2020 23:15:25 -0700 (PDT)
X-Received: by 2002:a2e:9cd6:: with SMTP id g22mr12582165ljj.429.1595312125471;
        Mon, 20 Jul 2020 23:15:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595312125; cv=none;
        d=google.com; s=arc-20160816;
        b=CXMGUXgAnu7R9q0meVOKB+ezdVURmM6zan5/KXOTPHKPBRLqPxcyE/+R1m+yJJUV7z
         V8e49ZMd1wKXWD3SXhwHe5cZaUned/ise8Wbcwlbuk1bXhSu9TRtwoFsxO/++DRpoKcP
         n3ltR+gt1XtlBhP74W9B4grjpQ/oXw80nReCnb5HFNIW/cMm+PkembeGNTtVkI6xyYTk
         iHp8yZbLkl6iZImcsBkHiN4/6HKZd+s/HxC9mgDnZXMqta8QG6fcAS325jo88mi+sAPa
         au2v0jylNcDiwvXNo1Rc6ZJGHqJRUJ+o5xY1OBRYNBR6KqU22zDjM+4mIuCzZ/yNhYQt
         zUZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=6dbe/pZD+TDYkyfoHLqPT5Wsb5vY1dbcReuJ9qKnkNc=;
        b=VXMTVCBi1Awv8LmYF+1ggrbnBnKOU7z5lsImgY17vCMtTUAxTThKgFSyY2mDWBUfeA
         EAcScGP8EBMoeSIvxF/eHPMyQT5y8sm9GQl2gLoTcPF9erXaht5qldBRldopUA/w7HAI
         TfoizbAQU2bkU7sG6UMx3/9p8pSkMvLZmV09/WMarm8CAr/UYMIaklebE/qXcgw9D38l
         zBTR2JDMHufMCXD9QthHjimgJjwm4/YFPu/dCD83rkWpG1W369Os+0g+gEElhWThVFjw
         ea0dk9uzx9554vxBr1wMR8dcj4BpvdZefmZ3HQQj6hQkoMXepEr/GtQMvpzs6yiJS2zD
         7ggQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id 141si148178lfh.4.2020.07.20.23.15.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2020 23:15:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 06L6FOD1006130
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 21 Jul 2020 08:15:24 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.32.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06L6FNaJ018114
	for <jailhouse-dev@googlegroups.com>; Tue, 21 Jul 2020 08:15:24 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 1/3] configs: qemu-arm64: Move virtual PCI host out of flash region
Date: Tue, 21 Jul 2020 08:15:21 +0200
Message-Id: <ade3231483b5e5b16800f48b56e2e2c45ab67a8f.1595312122.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1595312122.git.jan.kiszka@siemens.com>
References: <cover.1595312122.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

QEMU puts virtual flash between 0 and 0x800000. Avoid this conflict by
moving to a real free space.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm64/dts/inmate-qemu-arm64.dts | 2 +-
 configs/arm64/qemu-arm64.c              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/arm64/dts/inmate-qemu-arm64.dts b/configs/arm64/dts/inmate-qemu-arm64.dts
index f6fd548c..6f6df682 100644
--- a/configs/arm64/dts/inmate-qemu-arm64.dts
+++ b/configs/arm64/dts/inmate-qemu-arm64.dts
@@ -96,7 +96,7 @@
 				<0 0 0 2 &gic GIC_SPI 109 IRQ_TYPE_EDGE_RISING>,
 				<0 0 0 3 &gic GIC_SPI 110 IRQ_TYPE_EDGE_RISING>,
 				<0 0 0 4 &gic GIC_SPI 111 IRQ_TYPE_EDGE_RISING>;
-		reg = <0x0 0x07000000 0x0 0x100000>;
+		reg = <0x0 0x08e00000 0x0 0x100000>;
 		ranges =
 			<0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
 	};
diff --git a/configs/arm64/qemu-arm64.c b/configs/arm64/qemu-arm64.c
index b2c2278c..2e9fcde6 100644
--- a/configs/arm64/qemu-arm64.c
+++ b/configs/arm64/qemu-arm64.c
@@ -40,7 +40,7 @@ struct {
 				  JAILHOUSE_CON_REGDIST_4,
 		},
 		.platform_info = {
-			.pci_mmconfig_base = 0x07000000,
+			.pci_mmconfig_base = 0x08e00000,
 			.pci_mmconfig_end_bus = 0,
 			.pci_is_virtual = 1,
 			.pci_domain = 1,
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ade3231483b5e5b16800f48b56e2e2c45ab67a8f.1595312122.git.jan.kiszka%40siemens.com.
