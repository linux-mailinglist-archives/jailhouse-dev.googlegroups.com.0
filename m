Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBOWLT7ZAKGQETJ2ARAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D44115FE6B
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 13:36:10 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id u8sf5669565wrp.10
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 04:36:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581770170; cv=pass;
        d=google.com; s=arc-20160816;
        b=W6Il5MlGvya+L4NmfircmkBYbzQ5UWiHWJTLY9P5WqOT3jHNjrDc9BbURdFB9EXcPt
         bI2orHPAVSBCIgFDBoX1Lx8mgldEsdRtartqsmE57Dlev3ebtrsySsCWiyIZXwaFFVip
         z2uDBT7M5gwqX6l+qr7P2Gl0k593vQbCVtJU9keFdB17znItRBOS9Jsz8Js3TFnJLgoc
         bGTtV9NQG35Lk2OScBTJDPt8HZ2aCbLGK0+mio3Nu6X4kEAUlIp3wxWvTRehf5Dp5ozo
         sWFVHzqlGTgQoD3pMxnUxKNQdQXq33MGLu5MU6f2Az/ppvbrw8aePEL/T7St1Nfhz4il
         /g+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=6NlnqRti2elQ9PA1jQd6hc4vi9wkz2kuJ1meZ70xCMo=;
        b=Wam35MSQCtH8GL0yO8p5nXO2Ni9UtCrluASJeMaJKDLqyZsr3vtFTtxFQIXAUXtzEf
         Or0a6AzbAwz63bopdTyMY23KxuAvTbTCWq6Qfsuh2om1AitiBpaFgttRI0VGpxXKs97o
         BR5pvKV78luC/OtkW5EuFuPhb31ayMKQfQ61EbTVUJdsw6Ea/KKQTSiHdZYkIRedfPAQ
         NIxmxxcD1RNMmXLGeyAY7X2TlVfHpRdSVwGBpxqzO4a2f7MRleK20Ng5WcD8mXLIyQDS
         BqJvk8EmuuQz9ZbH6hLgMxlFWPDK7pntxkZQoWx+Os2H9xv/UsDjBP0uP8sqi5GZ4faM
         L0RQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=i9PwKtJa;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6NlnqRti2elQ9PA1jQd6hc4vi9wkz2kuJ1meZ70xCMo=;
        b=H6BBAX6rsmnWAfbDl0eyBwAAY+fz0rk+X+YDu8pWxhSZ7YsHuxXrnIXQQQuuOfDWAK
         O+aJIU4AL6u7XqH7qxMAxICVGojPuBW2AitgorJhg242ecFcsai9da7VcaD+v+KtHmO5
         zSFFz4r3Mmn9zD6CiCudzSvkJoYlQeRkwp6KZ1DZ5AitzUewRVHAnU+sGsao5wRviPLu
         xwspO9AEgF9D4uZNKEn7Jim0vaqLH0x6wdAOhijn15PQBwAUhoLNX/aa8pbHp5WAjxlG
         1eo1HsW9RXsUNbH5+pkpUYu8SlasA5eWx5mUGSFM3bo7PdNxpAfSWLKNyW8J4Q7azVSr
         dLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=6NlnqRti2elQ9PA1jQd6hc4vi9wkz2kuJ1meZ70xCMo=;
        b=qioZqTev16vSR6FyJHZ2kBFmUwG2ZYblp+JYGV+/7CQT5fdLy3XjGpueHyYmR3WAox
         GS5c5ubYw4Veood9ZZHdItw8YKzcesUpMfAUO2PY9WFvUQKV5PTv4WcInxFe6RAc74Ky
         sP4y3APDRvPE6TJwGq20tgMVBpdxTJwSNwTx8I89yFmeCMeCqBB/50LVyHShC+E9/HCd
         JHPA3mP4SRnMWeIw45X8mmqadpO1iPcwAVl/vvkiu+UxxCXXOe+uMQF4KroAz2P114u4
         u1dJ6uYq19M/4XPyKsYlfn7NzuytFQ0DxPlAjQhY7JkmmnZxvhOWkY9MBvKqgQ7Uk+MW
         35FA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVsYB0bwFdj2jP0BdHfeDhheP5BoC/pRkukSq0D7xqh6aJfVkf7
	722edeQwnTONqUsBzyKjfB0=
X-Google-Smtp-Source: APXvYqybd2PA1jr6fqMHmQ67IiLiFdrj5+o52ERomUkpzhXXCAf5a9g3kc7SjrlZFHM4SIJpq+WlBA==
X-Received: by 2002:adf:c453:: with SMTP id a19mr10134026wrg.341.1581770170369;
        Sat, 15 Feb 2020 04:36:10 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fac2:: with SMTP id a2ls2985767wrs.4.gmail; Sat, 15 Feb
 2020 04:36:09 -0800 (PST)
X-Received: by 2002:adf:8442:: with SMTP id 60mr10185068wrf.416.1581770169732;
        Sat, 15 Feb 2020 04:36:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581770169; cv=none;
        d=google.com; s=arc-20160816;
        b=PsszW4V9rcpdXwNDboNiBLbvgL1sEW59AtXCWnVrtmyCeULoq8WaSX1aiOoc425AFy
         dX2iQ2uWgnncTjxIgmp98Rul7jV3vpbHhL6WHF9YiMyaXHNa7QQas9Hm9j3/1OUcgxNM
         PUR+h7FUh7jTujB9fMKupdhkRjQb65VXD38OgQIzcquRcJU9YiREcvj6H7v5fkWptFKh
         5ZHZV5mPMWlSS80U5dbABn4CYHGflY9HmOjZunG0FMoy12nKPD1wyxcQetJWkhh0He5+
         ND0BCfsbeJgM1YkE6fuAS9POfV3gnV/CCTTl1/2wbW7DhAhg3p1boNHN6+O63Uj2dl3i
         Hznw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=1fGU0OauIgNv3BDL7aHXtL+lZgvToInvuDVTKMlRFLM=;
        b=0JJdCxe3vCxtCiGl2uefuYcvhmuTB1B9lp/Kwhm5NC5GEJb3SWOvZmrU6ywe46K8g7
         75IM2f8Tr/Pj8d8YIyiBoDhY5bpE31tr7tda+2zCGPJLIMKiLzRysdAVuuUuZsl+Ud8b
         P2QTlbXZRQkZWZ4Tsd0WBr0HigGFijd7B71Zfv2qonYzKTq1fJ7KflxnkQ/RGIBXrplP
         bzNrTyXSp0+kexg6sgI3L62dk5b5MOIwrch5t1pDWxmYOdS0Lq7NrAe6cyt3hBjObaU4
         3/oJmqfBc9eOsMDoBgbUjjo5fnv5yxgixkpBjQf8yDDb+584SlZwAjDrojUFZBVezxMh
         2wTQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=i9PwKtJa;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id m2si271711wmi.3.2020.02.15.04.36.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Feb 2020 04:36:09 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.55.156]) by smtp.web.de
 (mrweb002 [213.165.67.108]) with ESMTPSA (Nemesis) id
 0M5Omd-1jP2EI1WIB-00zThf for <jailhouse-dev@googlegroups.com>; Sat, 15 Feb
 2020 13:36:09 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 01/12] driver: Leave a comment while on_each_cpu(wait=true) does not work
Date: Sat, 15 Feb 2020 13:35:53 +0100
Message-Id: <23f82ce47f923fc6cba5696513fc5cba86dc89db.1581770164.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1581770164.git.jan.kiszka@web.de>
References: <cover.1581770164.git.jan.kiszka@web.de>
In-Reply-To: <cover.1581770164.git.jan.kiszka@web.de>
References: <cover.1581770164.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:gX5ots7K0mD4XEMeUQyR07kmSQBgvMFcoCihtCaFIFIEgV1lIAc
 9yei2UhpSQvy67ryCDL3q9K6+JQrWdSc/35tjiT87ZSm9VVbMf6AgTGSBzVHTl9f0gamO6L
 SSaznc+tbwx+SVmtPSo0bxS5Kn8beNfm/Pik3nfFKffSHHsv1hDcIXNSbeedX5HB4UgDdmC
 a2L3q18SvScdVMv7ngAxw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HXJwIXqrMtA=:BHnfjb7IDml7vhIIAa/sBr
 7mz+IMqaayK9pt/Y8nsItlPf93nncLJE+H8X0wkQCSPomfkQr9+iih917GF5JnayGsbnrH3ZL
 x9GD40ceoIpxFrHCuBuKjM9wPjBUi6B7qBAbkV25gRrdMYrlG02ubDu79rznkekwrUi2kIlTc
 VKQ6gK603Tp2PlAcjjTpUmuirud94u7Skcn9oI9R8K1tuXy0RiHy4/RSNXoryCeiU+m8EZFsM
 r77DLjBDnf8khJ4IP62MuUz7NlDlLXRywPmH4j3YRL4prywVrsbOvrnaXzVPq7Q8c0NbOI4TV
 EyuFr8ZglGS+qs8vux3gOqCEc4YuwiU7iUZtCWXjQXcw/OpksJbTQ/yZToFeASz9qdBJyBZZu
 aCoCm+QnssOC6soUEhRMf0qqCQprfvBej7YNfpnSBX891SD1xCOn7HMv5b98F1hJitgykSfjA
 B2c+7YsNGaJVQknjfhMFyHDr+xawbi59MqRDrpIf4f6tfFoMpq2UC6+dn33h7kSvsA1NJ9I5C
 KgN2dbJU58zefT73Vaht6AHgJqfBXCQdA7SdP3rhyBGtjNga9s62Spf2D7vzUrD05Oh04AO1M
 mSaMPP+Wa3/7e/ltxrgmfsh00rdA2UAtc59lcVBN6A6qqSw1EVfDSQQgfgFrDl+lMMTHHX/uE
 DSC2+4sDbeoztpSml1C2RKJIJAWQi//0eLGwhvhFFcIwFY58fNNSV/wHyO0jc95YYqtlsEQ4I
 BMiNN4I8ZcC7zzVXZGTnER04hn01jZozx4HgpKoC3WGznTIRLmEBSA37ZXgIFds+ngm6Z8iqf
 Aj736Hl7MserE0XKMaT3RkzNsJHfj6DssTQvlQk1WNuJ+z4CiMZUfUnKvzuj29av0AQneOWiX
 QHBtV9V/ZicINkiOyBq02qOfr4+wCgGfPqZgTkGoBD4mJboSZTsO7xbYtESL/tEunJmL5w6Mq
 eINykReUZYLlFh+6pThigEzD0cHaOgt4XZ0XTbyN1BWNu2lr1VlfgWxvkIUvtmDD9z7o1I16k
 AVfbfmqtpQBJ/koaJ9SvBfyZWEbK8tQO/o4ayPD9adTWxoF4oetqjsAKtG4whDd4GJOMEjg4b
 1NotxO+wnPEcGcxOVbYVSyus/r6NhW2f3bEV9P4dUxGkngZzWOTveEqm/k7MtDLHac8Woa3MG
 1JtwfXDGUcs1/GeMzUym7/qb3zwMgQGE9X/wialOdVZCkb/WGUGrn5ZuBC597NXLQGZI11KWB
 Pn6y7N0n6St+n6Do+
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=i9PwKtJa;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

Easy to forget when looking at the code again.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 driver/main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/driver/main.c b/driver/main.c
index 41552b74..01e9c049 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -572,6 +572,11 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)

 	header->online_cpus = num_online_cpus();

+	/*
+	 * Cannot use wait=true here because all CPUs have to enter the
+	 * hypervisor to start the handover while on_each_cpu holds the calling
+	 * CPU back.
+	 */
 	atomic_set(&call_done, 0);
 	on_each_cpu(enter_hypervisor, header, 0);
 	while (atomic_read(&call_done) != num_online_cpus())
@@ -697,6 +702,7 @@ static int jailhouse_cmd_disable(void)
 #endif

 	atomic_set(&call_done, 0);
+	/* See jailhouse_cmd_enable while wait=true does not work. */
 	on_each_cpu(leave_hypervisor, NULL, 0);
 	while (atomic_read(&call_done) != num_online_cpus())
 		cpu_relax();
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/23f82ce47f923fc6cba5696513fc5cba86dc89db.1581770164.git.jan.kiszka%40web.de.
