Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBY6442OQMGQEPZGDQZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63d.google.com (mail-ej1-x63d.google.com [IPv6:2a00:1450:4864:20::63d])
	by mail.lfdr.de (Postfix) with ESMTPS id 56471661094
	for <lists+jailhouse-dev@lfdr.de>; Sat,  7 Jan 2023 18:39:48 +0100 (CET)
Received: by mail-ej1-x63d.google.com with SMTP id sd1-20020a1709076e0100b00810be49e7afsf3012643ejc.22
        for <lists+jailhouse-dev@lfdr.de>; Sat, 07 Jan 2023 09:39:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1673113188; cv=pass;
        d=google.com; s=arc-20160816;
        b=w5eh8N+oGjDNRwm3mzpt7aq97uIlXl/2qNKFEIHOKxk72fVZ0t8OqLWA+MlckEYhF2
         bajcSysgiQILNZI7/TDgFpOTEOgzaedcdV8jVzTdvNJZJ2ntqLIg62wxTsgr8xl04tS9
         9Ic8vTds0UyhEj9pqKGMxvS50xdeJS0tMcHuPCh+6jdOMdJzpAXINs5SCDUpJfXXVBjN
         Ymfd59hgaOEVHelTneP8g8mbFXKtdwC8QM4N6r8lPyXCdckamlRbBJAPHnVpoWX7qCeD
         b35TRlo38d6uH38uDgQTkmgjFj+sBRD/kFJjc7nEzfGP/enCUkm7RR69SNK/ykF67Fn6
         jArw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:ui-outboundreport:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:sender:dkim-signature;
        bh=A9GqiIVPVnGc+zP9FYQKox1hSMoBl28ofdHaVuvnsUg=;
        b=WDjQHUXFQDzp6/gAHBBGvRspwwrdUTEKLUz/nJeKvO5S5dKpztm7fAICSr5pilRwL9
         N+Zzn1oXiktIyZx/KmqCHJVnxPyqdQzDwNWu9BpX3vPWv2+HG2+vrzA50CJfFl68A0AQ
         2yKl6d+HIn/BeLg6oK7J67zGjf6Ak22go/P1zGqCI4Gw2poXQPa6zdiEUlVFT7RvZ/8k
         5vXtwuMuICf4Tbb2yKXKBExaDhCWeSXyaQBird4Z+/EoFnql1XXQC9qVZKjb31Etwobp
         BPkDtaoK50O3Q0VWLuZ6U7kZbwlzqDfG5gKc+Bpa1d22a9pFU2XduQqP0uFt31h46qeH
         Dm8g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=s29768273 header.b=dRGQY+4m;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:ui-outboundreport:cc:to:content-language:subject
         :from:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9GqiIVPVnGc+zP9FYQKox1hSMoBl28ofdHaVuvnsUg=;
        b=qQ5jHgUVekUQ9o/XNbhswDncOfAZRq0HEaW9id8IN0uO+3Tw/CjM7tkt3XlhjJD5GO
         zzv9kG8MUEjyGBPy0RR4IkTMUt4ayqHnFaCof/RMmiZ2eAV9nKf9L55gIFnk2TkHZeGy
         DwEOFV/VvGHSBOXX4sSMXLfI8hCVgpcFyAvsUsr7OKk0dr14jENMUT3x/D6ZYyK/42D2
         v1r9cj40EKIaD6XoTcI9QllFp2/mUAmqpS5P0DkOt5zoGv1PsU52z3jbLCBfeE2DOx+4
         dkB1xdFPt6yfw8XgxAz9/K5pEwUnWh4f0B46zQOQyD0XulQg7plwPMuKIaMcsIrHTZsH
         Y12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :ui-outboundreport:cc:to:content-language:subject:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9GqiIVPVnGc+zP9FYQKox1hSMoBl28ofdHaVuvnsUg=;
        b=7h43DmPvSmuZDBRMbD7eEcJDvzWfjiqZBHGXgzV6MIAkMRg2yy2kJTC+nKaHiDmY8e
         qGhzq45zWir/HMxlHXv4qiKEh75AR1K6xfbkXdHxEA1Vj5RFaUXYXX01ALB6H0inHNE3
         C4YXCdF8+ej8ldkTs3f5Mp3Les+pI9Adow2Coae09jI7afD1F5RES9vvPVBdp7oqhuNZ
         GPZoOEHCuaPrwvDrqKF2RGZA55jQmD+6y2RaiiuhAkM1VrV4nvwjaAOxphOSArQ9pmSM
         T9BPSReGn2dGLzBL/hF0oJdICDBybBSC4AcxxU0jdyBv29n1GGtBlEs5+U8Vr6bTR/XP
         jyOA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kr2cJfmF+7/zWYAuvhq6p1Re8pen1BOu5ylvTlbZtChZ59KtxiC
	xyvWoCP7LrVoWm699zVJHPI=
X-Google-Smtp-Source: AMrXdXtkNNm+NgSHdywx9aslkvL1eG+6brBlmVDWJ/QMIImAtxU687MPw/UETCiS+RlKIV/hP+zxXw==
X-Received: by 2002:a17:907:10c6:b0:7c1:6091:e7b with SMTP id rv6-20020a17090710c600b007c160910e7bmr4550319ejb.513.1673113187801;
        Sat, 07 Jan 2023 09:39:47 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:26ca:b0:45c:bfd9:fb45 with SMTP id
 x10-20020a05640226ca00b0045cbfd9fb45ls967317edd.3.-pod-prod-gmail; Sat, 07
 Jan 2023 09:39:46 -0800 (PST)
X-Received: by 2002:aa7:c6c2:0:b0:46c:f113:b9bd with SMTP id b2-20020aa7c6c2000000b0046cf113b9bdmr50314983eds.6.1673113186415;
        Sat, 07 Jan 2023 09:39:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673113186; cv=none;
        d=google.com; s=arc-20160816;
        b=PVoh417TAy5Ckz3DFduxziKf6Hdc9Hjl0L45vnOCXxNZDFfeyfWE7UY5y779yIgFaQ
         d7j7QsYn18j+P1M6LiksGvPJrs2sr1zhf8imWvkEe4P4T8dqwvqLX2cVxEZS1lykDGWa
         jdRNKPSZvC3CbJ75+Cssn/yrn5YnBIpv+4mu4eXd04Z97EBBpUwJGTWrPhB3XwcxnP0p
         fdUz90pAXqlXFz26Svbp53EsFUgdHAj+gEZf7wNoQa5BgyxO+V69NLrjJ7Y8cIUjGLiV
         yhDq1z45+NCbD3x25UCx2sIespBpKoxp4kagkpjKhL4as50UiZr+rIqi5F/uV+6S9Gne
         fTqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=ui-outboundreport:content-transfer-encoding:cc:to:content-language
         :subject:from:user-agent:mime-version:date:message-id:dkim-signature;
        bh=GGPQAVzJCc7P276QiMlzA531abfz6EN+10MYBOKqKss=;
        b=yyN4DWUIV0dKvhRatmSCRuJ2mMtwVMFoTNH3wVvtb7+9ghYB4k64+ChFHJfTSMdMR3
         o/QBIpdQ1nIxQqy4lxiAAlh1RtXTDyKFjRgjUv3coEXNpoqb7Aw8YU0a2F1V7hrqUJ92
         ltUO0uV3/42VuXKTjfoU71OSyS4k2evdKhvPWa5DKHTbgMAylKbZPF07p7Hi61JONvNN
         DOx8DxicBEd6HoLzCVnikm5itWiwL3sk/Pr0uV2t/et43esO85v5PELbsdaeSChxS6Na
         /QC68I1WjXV2BJybBdxT2GimD0D/1iu11xXqfWjQHIX1nwFv4Oq8z+lyTxqO5Qu7q878
         LJjw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=s29768273 header.b=dRGQY+4m;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id q5-20020aa7d445000000b0045a1a4ee8d3si172713edr.0.2023.01.07.09.39.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 09:39:46 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.10.10] ([88.215.103.113]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M4KJX-1pDwBc3blZ-000FPc; Sat, 07
 Jan 2023 18:39:45 +0100
Message-ID: <bb0226f4-5c26-0fc5-fdfe-e6d936e34102@web.de>
Date: Sat, 7 Jan 2023 18:39:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] ivshmem-net: Ensure that napi_schedule is always called with
 bh disabled
Content-Language: en-US
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:QtQE7woIRSATk/cFHStrsFGtqgG+GPYbdVo6Qw3JbHt4bSv3btC
 RR4uz0n5N1aU4Yq4KAF4yj5/3Cdn22GnUI+fJ9Aw3RqhVrTpNFHKY2n0nDR7ewIfZumLrBI
 GbeLYhxVUIHqSG9eaTmiBASy/qV7rLAJyMvrVN4sT5Mgixa2wctZnkxUvKiKLP810o8Dx+P
 vamJJ4BWX1vBzECsnmCsg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:r0BHOS/4n9U=;WHO+lmahoPfG9AfyOC/qtMlcnIH
 y2WFrAfiFEXQfnhHtx7axumO+POCTYOQvtodJkBYy9zb5qDFTAq+xwsHQ+asAoxYFXLPinnXF
 AjuX+FFpQeAK5PL5whM8YBCfQqQ0vQRozc1v/yFyW8NYjV91J08C97z+l25Ia1So+NshPCTFf
 YVPktu9EjqBwvU3vc+dfczSxLvdW/jVOZ1WE1c7/A3tYZB4puX+lWzX15H2WIW4sQ4QK/DGOh
 dP4lPYNUD5kNxkNaRhYEHOxhMKdE+AiYMS0IrX9ftnM1kqGgA1B5JRm7+2gAfEI9DXcMre8/q
 cvrw/d96DXor63vCdd7zUrR6EH8a/915EkKIW1zbj93b655TCcunq03Tn1SLxkXY82CCKAHzI
 x8RHGTQuhmL15D43XX62kCAYjuAeB+IoEA0A7Xp0DLpM5eoLaKI2UNbfJNtzFq1/wjqMsteb6
 eztQoMoNa8wibt8HAu6NnuiJDhcPCclHE9uy8YGGDrpZ5oUcVoLFKgB38oj6eDeLjS3uVU44+
 WkVAXEbDH/eTJz7m3Vi2DFIv4Bg4UCu9TgJ8Vub8hYF5j1kfbKL/ISZfUw20oN1z5LOv1TMWq
 vutjh0yNK+OSIJBwSuUL7eEWrbz0hMzz0r7Q4wz/Wt8Hyx9BFhtHYSEDqhLN+Cl/ge3i0qbhw
 dgAq8cP8EKENqQzQ5ZE/njd6snDaeZZh4DcZax5KG12e5gwHv95J2rZ1Ywoh9qf5FJdniaHAH
 DJ3KW3d7Umi1XzQ5UNVatKwpjs/5ySYIXDoi/9GBXMiadkAKavkPup606ks1VYtR6afpfRIbr
 2y9RQSrKf3bCVzVDFXhV8MH5sjY9kqZrYYKtM4vX+pSwOZ3cpGcoY0yYppsg7CGjljhqErHn0
 J2pqLCCk3obHBg6wretKbFElJgpyWsyUa9jsuTcNSOnamxfwovDYhwernZvlbmOyihU7CpTV8
 CSl4V2Fx9Uu12NxGEzxYwGAgr8Y=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=s29768273 header.b=dRGQY+4m;       spf=pass
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

ivshm_net_run is executed in task context, thus also with bottom-halves
enabled. Calling napi_schedule in that state can cause problems under
NOHZ, see also

https://patches.linaro.org/project/linux-usb/patch/877dk162mo.ffs@nanos.tec.linutronix.de/

Therefore, disable bh around this call. Other invocations of
napi_schedule are not affected:

ivshm_net_poll - poll routine, always called with bh disabled
ivshm_net_int_tx_rx - interrupt handler, bh implicitly off
ivshm_net_poll_controller - always called with IRQs off, thus also bh

Reported-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 drivers/net/ivshmem-net.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ivshmem-net.c b/drivers/net/ivshmem-net.c
index 9406b4dcc6c0..a80eea5aecaf 100644
--- a/drivers/net/ivshmem-net.c
+++ b/drivers/net/ivshmem-net.c
@@ -558,7 +558,9 @@ static void ivshm_net_run(struct net_device *ndev)

 	netif_start_queue(ndev);
 	napi_enable(&in->napi);
+	local_bh_disable();
 	napi_schedule(&in->napi);
+	local_bh_enable();
 	ivshm_net_set_state(in, IVSHM_NET_STATE_RUN);
 }

--
2.35.3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bb0226f4-5c26-0fc5-fdfe-e6d936e34102%40web.de.
