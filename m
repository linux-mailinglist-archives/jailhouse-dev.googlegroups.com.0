Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBNVZWWHQMGQEYE5MNRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F034971BB
	for <lists+jailhouse-dev@lfdr.de>; Sun, 23 Jan 2022 14:48:39 +0100 (CET)
Received: by mail-lf1-x138.google.com with SMTP id k11-20020a0565123d8b00b00432719f58dbsf7867243lfv.22
        for <lists+jailhouse-dev@lfdr.de>; Sun, 23 Jan 2022 05:48:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1642945719; cv=pass;
        d=google.com; s=arc-20160816;
        b=EqrTfwqzRqbaCtdtBHQlB7NWjUJf2gjhIMSHZY/+6ftWATpmg++g4pGkMX5PKCiCVk
         MbN5VNFZ9nkvJ63sDbtlg0ttdHQ3u8F5J1hBxOSXS/t+TxZHnG17Bg4n2rj+cf8fIseN
         0t1A0SIL2vFvWVGHq6oRUw7QaGjAdWNXIV3tafaSEqisFU5d4SYmKmMS2JNHB1wjouKi
         SqzN7T9B4di5/v3d7F9N7zVXKKjJuWtTjG1rUrGAmTE93p5wrI9wLModx+pksMM3glw5
         FL6To682jimBrpSqeF7ifzVM0F4QhfJ/NMgIqhOW1q4HLQXww8HN8swPMdY3BU9LlVNi
         /ZcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=+eWIX1MFdtTAngYe4rYYF1rcN/roJ/KZV6EVVm1mj+U=;
        b=QmnrljfJzEiqVpjEMLZjgsbJIKYlFNm8F4u3NYeVpXzTDq476p3GEiffO1MtrC/QuU
         m/LgcGhMqt7/aXhLvMMy6a6z3aXyhqpyHMfREhEAokF2dSW9QpChL1ZpMUeub6EdKqhV
         f/SnR2TKvpENpBlzCmccczoLpimocT+8MRjIvrhSHApmZHjeGYfN+DhmyrSHQClF8Qkt
         4yZK7C22ZPXsdCp23x4Bu2XkdfX9ciZQEE/1fopo1N6sU+ZUQE3lh6DC+ZsG7mZ354/6
         atYoiqjvbjnHUPn6VD5J+sKSufvBD/plZbTbpTFyTGDUAj4tWNbQjXy/gJ+Gq+LhaU/h
         BD1Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="TKyR/9IS";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:from:subject
         :content-language:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+eWIX1MFdtTAngYe4rYYF1rcN/roJ/KZV6EVVm1mj+U=;
        b=WUfg25+2NE82uOVFLXqiYBJ7ENJx8e2nNRXFxDw1QjNgcVb8VzqREz+m8uGZD1wYf8
         WP044qgyUcCrA7XL5UykuOmCZJxtCZbeguBgS4D7xa3hI1/y35gd9ya/VeSXs7+VodeX
         mr1BmgfyM5WdkR4l54ZO87MjonIl0uat9jVDo9n5b0eMK3cxVirh91dIAyFleRiGUV7E
         kYGYkqclR+fjyocGosu7sk68+u1OvsuppPzbaXR5zgdRk39na87t2+PcTUgv94PHQRb8
         OkOozFY16gaNowiNCsrAfKqKgD7JamLsRuedaBXSb6hzv1rOJCSmCjOsmD7Rz5UjcNuO
         e3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :from:subject:content-language:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+eWIX1MFdtTAngYe4rYYF1rcN/roJ/KZV6EVVm1mj+U=;
        b=B03QMnz8qT5LrlLkWDEYfCGmrk6xleA9+al2e7d0gDcDkxoRmKAAkVN7tgEpZb2ogM
         UDql9vj5rk9zrhee40MneHFA6pGqNw9vrx49FpNwsdohOLeCrU0lOFB6F1NYN3dGdSrI
         /tZCuiSdIcxr1OiHG722oclCGSYYOMbhiSJXxvD1wPtZcgDYt8EwG87Mqf6t9PXAR0f6
         ARPDbExf0+yLmTgTQ7O/ViFVgjFLXAfwoM01Zr7XMXgN/QP7DOJ0BcSCTPxG5IEiL6bj
         +d4Tf+JR+HVEE90Zfz0+1e9G1joDF/NqbcOm5MD+gUti1h6JQQnzob8WX8/9/+kz/cqE
         aMeg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531bms5G/DL/WgW4DEumyVkTFaNy/LG3bTlMUIlUd6pmsNwOKvoV
	rSV+giOc3HzNmP4JtXVsLn8=
X-Google-Smtp-Source: ABdhPJzVbeVnYdXcgaMIY3EkOkVQSTQv4AkYcTu7WkwMtBdnKS/UMipL6mcU3kjHQLKegnxRIt8scw==
X-Received: by 2002:a05:6512:4020:: with SMTP id br32mr916997lfb.654.1642945719265;
        Sun, 23 Jan 2022 05:48:39 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3b90:: with SMTP id g16ls385736lfv.3.gmail; Sun, 23
 Jan 2022 05:48:37 -0800 (PST)
X-Received: by 2002:a05:6512:3247:: with SMTP id c7mr3828207lfr.195.1642945717772;
        Sun, 23 Jan 2022 05:48:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642945717; cv=none;
        d=google.com; s=arc-20160816;
        b=EScglpgOUf6LZBrex7zVWrScKtFTCJnY2ihD4D32/cNu9rZXMzlkBn6/MsVFNaBCtt
         FmAg/l3eO6bPWZJyE2iUJ4B/ft3OJ+EzkG5e0z4I36MqdyTCBaJbjLbNRtbmGQD34Ozm
         h7fynrj4A5uzHx98/WjYo3RZE1LBUKfs55R5GfDjY/+LqN//VXY4Kau/nJ87hB3l7PlT
         7t+uRtw8QtZVOv4mVgxYI3Ge+90kASkLaZ61wO3MfFDTbu9sBCeWLaGMpgn2FvPw5uUW
         9UMeW4Pp7IhSEg/2gzSbNP/EkOtJkF1sECuGnCttc1IBw1/0/Wpks6KIdYfakG3Xhpsh
         cOPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7A9awC3For8RauYGhWruZSc0Jwpp+hS3httGLXDZ/ZI=;
        b=oN0rhU72SnvkKFtWXKFxW1111cTc5uwXIq1TAOTGz+eFlxfF9PHadj4Spf3uzqojMw
         v1PHPJ3jk0UFV6v/1bhYFNfoI6mAHwX1XugJGGPdoB8b8DxX0IbM3+x0qvSBWyhQ61A4
         tt3vfoTMcj4GK9d2Xz8GvoiLEgxI9ZYFwNVQ6RsdQLY11zxxdUyzmDqzblCvibnHOMKx
         yTfnrbE+4JYn52IYxO+igGlQiTWUdKxYQN+97UKVpq0kwanJoSdDuq+SjHfVnURatvmB
         hEunZLumQJ6I7FcKyW24D+qkv4Y42nEglQX3LMQZdDmWGtCzjUY3U1nSELL57bUNAzeR
         PN9w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="TKyR/9IS";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id i10si397521lfr.5.2022.01.23.05.48.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 05:48:37 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.113]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mq184-1mYjxu40mo-00nOVK for
 <jailhouse-dev@googlegroups.com>; Sun, 23 Jan 2022 14:48:37 +0100
Message-ID: <34bedc55-d7e8-df50-0198-f9458fcf218e@web.de>
Date: Sun, 23 Jan 2022 14:48:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] configs: arm: Allow access to RTC in orangepi0 root cell
Content-Language: en-US
To: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Provags-ID: V03:K1:IVn9hDbTvazr2l6LKfc1VcgCzEdhjvnXBNhBAddNYcWxEQuZdxQ
 nB404JGB6if5B3iUanzyF98gd9iRgiSDtJmBHQy6sbcoamhNJA1X8B4JBYtyKJiqGdnFmL9
 sy4KWrIvnUO2J9gaIGHn8gsVRUpDuAywFQtasQbI3c3sO2yerkf5VRPVhH2ydWElWT/g/Gk
 r5Rat9ukEvximctylaXbA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:loU9xA/NBfk=:aTMtCTlK7sEgv2yydGiyp2
 M9appLRlgfDRrwctxoMVCLyqIJq6dPCW3yHrCFiYxpm1oZrAyLvnU70O7Dw20fXRXv8z+J7pO
 /16W+iz9W+YZGdknySa2mbWScQ2YCe0MYtJbQMTMjiZRLxBrd/R3xXeTVVMFkHxltyhXqV1rQ
 dXTdZ87J/BkJNO9AyGh9GsqzlseXFMloBTyMi6IC2uKVD83v4ASiYNY3DihxJGscheqC4iUm1
 kUJ8oQIdKhmtfpzh35Dkms/hxcYVJzvE5geGhLyyxA/2MjcAvAonw2a7pAMIJzyBV3bCteDBT
 w1zlbnqTjMVslctSnbARCEcZK9nyfCaK5vMUZx2PYU/XGK61jgGHq6E8nQIGFrmr4IaxicA66
 9f8nbkseSxpnKMqXnzcIAT1Yy0rsMc+SABi3P5EF3/iBVAz27vbBcb9wh/2APVkoxy3Ej23fG
 uziJALLej6Sw40/lqq3udmcKk5W2JW6aZcWluv4tuFPUhqskTV8C5kJ6t1svcL+iD6DqFoInN
 O5Q4IVfbvg4heTew7cC5x65YpG7zxaYMYkXlOgM59VoykMwcHAkuuXU8GZgDn8Mh1iA0+Ht2a
 nyqkA7G0dYiNbclJMS6MEfnrp4C6MTPB5lqB/7i1hfC4VjHsZaPLgMoW9V4IT3eIVBhbQQw5x
 sujHtsxNWxf5WOKWA9xwaZZJ6K9bENXmaj24cEdkyGKBW5X87ti6Yj9dVrjHPIuqS1cR4YM3Y
 PQokyNF3Kx2VNKZpmRAPjj9xV1HheGL8JFAH6u2rItlD43eQVV2i99TH10187m3AVkTHZapi7
 llVt3EPopSPORBTSrexjpJIOMY4ekW0Td2B264RN5hlBIGqvIpTJXoUlLp3ZT1zwFb67BarQG
 PBwhzFpWJtGREdiS8hj7/BH913mGZNiFygkdFc0Es9IZAvYK/DBJlNvO4+Iv/teh6rxkpKO2n
 p9azcLUebibJMbotK1XXi701DppUv6lyC6OeH4OUvMQjiIVhC72MikNwRIGouDH2rFVZmYj+3
 BOeu388Tq1U1UztjTXhjr6bG1n1PTT6pentqcu5wwe14uPl3mHmMiWvUkHrhcGTOVO10+o9iU
 1zR7+4zPaUpyrw=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="TKyR/9IS";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
  configs/arm/orangepi0.c | 9 ++++++++-
  1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/configs/arm/orangepi0.c b/configs/arm/orangepi0.c
index 90b19b7c..c24344e0 100644
--- a/configs/arm/orangepi0.c
+++ b/configs/arm/orangepi0.c
@@ -18,7 +18,7 @@
  struct {
  	struct jailhouse_system header;
  	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[17];
+	struct jailhouse_memory mem_regions[18];
  	struct jailhouse_irqchip irqchips[1];
  	struct jailhouse_pci_device pci_devices[2];
  } __attribute__((packed)) config = {
@@ -142,6 +142,13 @@ struct {
  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
  				JAILHOUSE_MEM_IO,
  		},
+		/* RTC */ {
+			.phys_start = 0x01f00000,
+			.virt_start = 0x01f00000,
+			.size =            0x400,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
+		},
  		/* MMIO 3 (permissive) */ {
  			.phys_start = 0x01f01000,
  			.virt_start = 0x01f01000,
--
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/34bedc55-d7e8-df50-0198-f9458fcf218e%40web.de.
