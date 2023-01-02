Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCUHZKOQMGQEALWZAVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 7807D65AD98
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Jan 2023 08:11:07 +0100 (CET)
Received: by mail-wm1-x340.google.com with SMTP id l9-20020a7bc349000000b003d35aa4ed8esf6150363wmj.0
        for <lists+jailhouse-dev@lfdr.de>; Sun, 01 Jan 2023 23:11:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672643467; cv=pass;
        d=google.com; s=arc-20160816;
        b=XC9TydqlFTQX98bs0gkhudX2zOQtzv9phNvRFtUpgcDL9LwRWhaNyvp2I2vDB/HG5A
         M51FcVSRDVSPeHG2hhfA9ZNDsH4j2Abz0/P56ocGsPhHHyIIIbuKPTuNszQPGoFrUiGb
         nmE2B0G6oyzxS/DY3EM/BJbXmG2zIhSp5h8N+JEW3vUscPquvrzA1IMGIXtOpyqUZJQX
         Dah0CccYi0LuVvWqTP5dJOeYG0TEabAVUEtWJVTftJ43HKNMp/E75Bh+UUhz8Nc3SbMe
         K+eNJ9JFvA5Spe4v041KoefNdWuByoWcwU6xAXKHguG0FBDW7oWQ1jMAo9FarihqmWts
         mVCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:feedback-id:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:sender:dkim-signature;
        bh=I+bFwJhgiIrr4YhGD234nxc38N2xX5oeaJCEX7iuXls=;
        b=Ae7+XEq4KEoJmJJgkerwR7MQ69UNMqoMvTBBaF+3COggqGXhqF0ZToJ2f1kaubcEOg
         pH4sIjcI2q9nT7d7B/5XNQvEN+sH8Ub57diz652vVj++w6XGit4eG6Gj/RKVD3dlf6MD
         WPZ5qfmUgvWHPzA07aQjLnGQMOYdatFRihzoxkzD+hm+/2U3AAaPmQ2jNl0AYkiylsez
         bN47dc1GaQ8WUzfSLVcRbjiTZqbx67MXsWWPSeBFcrvEoJjxuTj/Ut6wScnhjpUCrBSb
         Wa9SFpOnYFrsqzNd1FuaxFY30vw7vEOqXDVz/1yB7WfSo8vhPfy0o80eEt2zxV8nKz3F
         lzxA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=KNCiYFHb;
       spf=pass (google.com: domain of fm-294854-202301020711057b7f0dba017a95b05d-assnmy@rts-flowmailer.siemens.com designates 185.136.64.225 as permitted sender) smtp.mailfrom=fm-294854-202301020711057b7f0dba017a95b05d-aSsnMY@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:feedback-id:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+bFwJhgiIrr4YhGD234nxc38N2xX5oeaJCEX7iuXls=;
        b=JW5QgNo6R+7Rn/5BmUkEcGPeZggFrJLhK08JuNORoaE4F1YUweGW5XZp2IRnQAm6cv
         ZlN+8j/py0QSV9CTTPNRn4rUnN11PF8M8IV+Eqp+wbYWn9y5BTVWrob22yVSI2hMiQDt
         1uPnj+JUcVdKHaTUyfsL5RZP2zJcu29vECEAJPkwE+ccqK3rRAzEGvxDZAwKgFgp6aIu
         sOusZfBGmuI66qngDO5DREaAonHsi/XC8LcSqTY54bo1IZHuEltcfnnZGBv9uQrGflyX
         C+ouLEyn7XNhmnmDhltuttOCG/JNzQ8+4CR4aGyaX8ZnTZKfhYkcAEGRdVghP5a8wLKS
         tplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:feedback-id
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I+bFwJhgiIrr4YhGD234nxc38N2xX5oeaJCEX7iuXls=;
        b=j4+jX2MLV45i7qTDdZmfp6Ydmca/n0L6q3JcO/8SdT08ycui51JA06DhmZKdt0jan3
         ZfAZvHe8yBK539IVcZANlfFlOLHthrb+zNJnL1aW7dND8r7/tpc5cbjLFqBlsDrDuwtv
         vvM8fJIPPnSrnf3k6WXJqYTq0qFcDfHFTjTN/+XCzSfxGS4pyuo9feMv0pbOjcILMqv9
         6o7wD2beN9ypXfsn4le6TojUu5s2w7ep5gpwew2uoCK6vxd7m68VirsXZXOfDAhb7jqh
         71NAyblnA10oRRf3R965gcF3wR7KyvkmCRaZNdQjuPG09yEWTW7z237Tttq1l9NOk/D+
         CN0g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kr2zcwHVZLwjXE0+MI87DQEAXb1U7xFcbo4Ch1Swf1we1skWDbJ
	egoZsgICLXvW8g8/AppKBhk=
X-Google-Smtp-Source: AMrXdXtMLTC6ShL0YEJqbuOFpYOqsGFq2wukKUZXfpOVXKdNCWaprVfAMcjiFF4hzkQmHf5z4//XVg==
X-Received: by 2002:a05:600c:4e44:b0:3d1:e2e9:573a with SMTP id e4-20020a05600c4e4400b003d1e2e9573amr1951124wmq.106.1672643467198;
        Sun, 01 Jan 2023 23:11:07 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:541e:0:b0:3d1:cfa0:aeda with SMTP id i30-20020a1c541e000000b003d1cfa0aedals2982275wmb.0.-pod-preprod-gmail;
 Sun, 01 Jan 2023 23:11:05 -0800 (PST)
X-Received: by 2002:a05:600c:2112:b0:3d3:396e:5e36 with SMTP id u18-20020a05600c211200b003d3396e5e36mr27514200wml.0.1672643465559;
        Sun, 01 Jan 2023 23:11:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672643465; cv=none;
        d=google.com; s=arc-20160816;
        b=qaKDKuvfu+Tzvtje8sh3RbBd6Lc9WJ1eVgQ1mcg5Qx2whakqDMnLd3ypGobU0pmNQZ
         AdNcNXoMuriuOTvlw6AgJksY52iXCJpTA9U0vTM0JIhIbjFtNAvBQXHg9dS89EDshQOY
         awZd1Aaormx2rbdxoWZP9m9SreUm0OBsE20n3njENeRxrP5boE5N1CaQHh1Cq8vLgEaU
         OiVQKKPr7Q/nHrnSHneOcKFVIsX4livAruvB1e1xgKL4me7w30SAxmMX+uoIUB/kJzfZ
         Gz89zEGGuWxSxR9pH8hk0v63+XKL34GKmGkL6OzeeWvCE23RsdxIU0xAxn1aUPKD9ELK
         0KSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=feedback-id:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=FLzgeCkSfo6f7H2w3KwoQuezrwa06Spcbj8oDg6R0No=;
        b=TfgXpDgix8DvBSYGI9eMIrenbS7Uc2JAoyBl6ZyrjRlyKVLq9+/k3qffI7TE9Stzz0
         RX/hQadpc2FhQIoS3PmKyqcAt7o9hIslpQHyqUR2R0iBjRtIYp1T2rknwd0EJw+3vD27
         nHcjY7Hf2S370WMrFTjeDaS+jsjugFOfqwLlU6L3z7bBcJNC2Oqv2uWprO26cE/31twp
         Z8Co06cztVlsWm5sx6AYIt4ZXTaBviuPmkp6Es14WwkcWap4iKdrQ1QZT4UYU/dvPKEn
         vJHceYVp9WVwAToXPfkTw8pQfa0xSFTWsXK0r//+gNx8eZNHrtKX8R0hpEr/rr4mgCGm
         9olA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=KNCiYFHb;
       spf=pass (google.com: domain of fm-294854-202301020711057b7f0dba017a95b05d-assnmy@rts-flowmailer.siemens.com designates 185.136.64.225 as permitted sender) smtp.mailfrom=fm-294854-202301020711057b7f0dba017a95b05d-aSsnMY@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net. [185.136.64.225])
        by gmr-mx.google.com with ESMTPS id y5-20020a05600c364500b003c4ecff4e2bsi1187615wmq.1.2023.01.01.23.11.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Jan 2023 23:11:05 -0800 (PST)
Received-SPF: pass (google.com: domain of fm-294854-202301020711057b7f0dba017a95b05d-assnmy@rts-flowmailer.siemens.com designates 185.136.64.225 as permitted sender) client-ip=185.136.64.225;
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202301020711057b7f0dba017a95b05d
        for <jailhouse-dev@googlegroups.com>;
        Mon, 02 Jan 2023 08:11:05 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 4/4] README: Add pcie-pci-bridge to qemu command line
Date: Mon,  2 Jan 2023 08:11:03 +0100
Message-Id: <cfdcbcd245e06cd9006e2fa676501c3838af3919.1672643463.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1672643463.git.jan.kiszka@siemens.com>
References: <cover.1672643463.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-294854:519-21489:flowmailer
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=fm1 header.b=KNCiYFHb;       spf=pass
 (google.com: domain of fm-294854-202301020711057b7f0dba017a95b05d-assnmy@rts-flowmailer.siemens.com
 designates 185.136.64.225 as permitted sender) smtp.mailfrom=fm-294854-202301020711057b7f0dba017a95b05d-aSsnMY@rts-flowmailer.siemens.com;
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

Needed now as we had to move ivshmem devices behind this hotplug-capable
bridge.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 README.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/README.md b/README.md
index b5937300..dc2c3afa 100644
--- a/README.md
+++ b/README.md
@@ -269,7 +269,7 @@ enable nested VMX support. Start the virtual machine as follows:
         -drive file=LinuxInstallation.img,format=raw|qcow2|...,id=disk,if=none \
         -device ide-hd,drive=disk -serial stdio -serial vc \
         -netdev user,id=net -device e1000e,addr=2.0,netdev=net \
-        -device intel-hda,addr=1b.0 -device hda-duplex
+        -device intel-hda,addr=1b.0 -device hda-duplex -device pcie-pci-bridge
 
 For AMD CPUs: Make sure the kvm-amd module was loaded with nested=1 to enable
 nested SVM support. Start the virtual machine as follows:
@@ -279,7 +279,7 @@ nested SVM support. Start the virtual machine as follows:
         -drive file=LinuxInstallation.img,format=raw|qcow2|...,id=disk,if=none \
         -device ide-hd,drive=disk -serial stdio -serial vc \
         -netdev user,id=net -device e1000e,addr=2.0,netdev=net \
-        -device intel-hda,addr=1b.0 -device hda-duplex
+        -device intel-hda,addr=1b.0 -device hda-duplex -device pcie-pci-bridge
 
 Inside the VM, make sure that `jailhouse-*.bin`, generated by the build process,
 are available for firmware loading (typically /lib/firmware), see above for
-- 
2.35.3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cfdcbcd245e06cd9006e2fa676501c3838af3919.1672643463.git.jan.kiszka%40siemens.com.
