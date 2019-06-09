Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBTNN6XTQKGQEPPNKHUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id A63A73AB3F
	for <lists+jailhouse-dev@lfdr.de>; Sun,  9 Jun 2019 20:58:21 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id p13sf3496354wru.17
        for <lists+jailhouse-dev@lfdr.de>; Sun, 09 Jun 2019 11:58:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560106701; cv=pass;
        d=google.com; s=arc-20160816;
        b=soVIYcSgZvfsbdVTKN35aaypsCtOMq5Z4NnTkRs+flmQwc0HbmsE9CTPBiJRFmYzuA
         RAm/oQ1fRX43ycrUQ9s01i/SfCexv0vnefZj4VW7/PIjC9Go5CF4MuKW+SA3uEL7Y9/B
         VDsW6Qh5pAncSbVHsORfCGbldbEKyDII52LzypxSBPw1BkgtJJbmIZz9YfMSiija6wyQ
         ekIjSygff2JMS+NvMdT01tOKyMTX0m+9WxMhAcUHH0UAH1dWYt3aoIjs4+L8KecZqS6I
         vQrOiLKBRjZWhVJ3y8XB3jBSs0v6qbLzfVTVqKdRLoxKRlHgKnsRqP89ghBHcCqkbjg1
         d3eA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:cc:to:sender:dkim-signature;
        bh=ELSV34LlOdAtKH+2r6cfBBXwWy19Ltrhfn3VL/HtD7Y=;
        b=h4f/43xVTFeT+H4rP672wHozYPvD92eKTKqLvjWn7JMSiKK6LpvpVfEtQv8YUToY+z
         WtFcABysGaC8laVYcGv6L6RWJTy8VXldatDkWXH9rc9X3MQIgWjoXbdO3n3K0Kwo7w2j
         wGjS5bRTZpPlcc1MbViYYVHaaye2euwkgcS+cskvM5Gn+6I9nZSeTLxwPfJlQhVG84+2
         HUPTDmsM80qsDNrjhab0crcKSk7lWkKczrQrRhGFIVSrU1An670LoxvgnS202Je5cz71
         lUkWc3u9S0VVcwNUtUjuHZTpSAwKbVJuKVjqG+fZTGT4rc2oLAZYnTrLK11RDYGrQg59
         VuwA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=acz6ZPfU;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ELSV34LlOdAtKH+2r6cfBBXwWy19Ltrhfn3VL/HtD7Y=;
        b=Cnxf4zb4ajEjjqhVu1GnrSCQh7aHNNqBqr29dIg56AG0kny8THeoJu3LNtqNKdNhkU
         tX8FVyYpsU2Y6CoOay2wbs3LS15UVGnJ/UvP+xsCGcbaqZ7H2geAFdSKXWDgZdynQpbQ
         2fU/ULqmWFFW9mpo3uGfhu18/CBHL3YcewA4p7qex2mVIjGiNNO4ZsjRIpMeEVkheF48
         JEwoFwC8hLrvXCzBcU+ffm7GOU9WyqTRALreX+6AbWLGq9FKD+fLZT5chW086X12MjlQ
         Gw7F3y5Vb+qr2pgMlEufk4bwpvHRRQME9ukFUUiF/diLjOFDyA5zCnfGgn0JuEHQjs3m
         T+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:cc:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ELSV34LlOdAtKH+2r6cfBBXwWy19Ltrhfn3VL/HtD7Y=;
        b=K00n+ylN+7lS6sL1bxRfib5Z1EgzgiuPjD6CQwmzesziOr69qLOf7PeYljID8/ioOC
         ve59bkCHSfH1EgvHS/3pxCvm1/CBsXqidwhGpmPzB9p7oqzUYXAAs4r63b6Q9u17ORYx
         UGeEd+kzBJfJe07r0U+2aHxFWlvLnM69SDOQgZ7CEStbptlxBoe/QFlClDGFW/9+l405
         2TdAGkhYnCPbGYUiuWPS6TVCegvZrMy5CvcGQd8pugiCD08Tcsb+qMtHKxuREwmDhYKl
         VQmlKqmwb2WdTi2fdzwRX5DzUZI9RTET2Vy83pa5Xvgi8WigYm8+xFNcJpckrGksVNjB
         Ehhg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXSJnsfIYAKaKbC+HVQrgrlGAiXKfGFTdVS0e70kYY5KT+riLKn
	N/ep2m56AH/0dr/KJZfGEZc=
X-Google-Smtp-Source: APXvYqxWhaLjP7L1vDpYbly5g007SV4utkscPC0/PdCiYLlfhR2GCCMUHlJJUhRNhxF2GogvHeRYdQ==
X-Received: by 2002:a5d:6242:: with SMTP id m2mr30129844wrv.310.1560106701413;
        Sun, 09 Jun 2019 11:58:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:f404:: with SMTP id z4ls4122965wma.1.canary-gmail; Sun,
 09 Jun 2019 11:58:20 -0700 (PDT)
X-Received: by 2002:a1c:9dc5:: with SMTP id g188mr11281451wme.93.1560106700813;
        Sun, 09 Jun 2019 11:58:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560106700; cv=none;
        d=google.com; s=arc-20160816;
        b=rZ2uQ1YkQ3a6p1K0ON0EBPJ9PsYm2X8TuqYk53QPs7J41fSzFXzVraSTbDy80cNuFr
         PCTJSCxxkh4UTCMnymdQlUIRValOG4itD+WYqimG888xy2G51PD8h3Z9VGN/2dqqwZhO
         BpXaA0CjyCo9oWmTvLHC/Qfcw0vE0UTKAWm2RxXKUY9v3BhzbtStySOKLRtz+1WfqL13
         k/OgDxLuqiGke7NqGyuTl3OfJKHMNRQdfv2zvwomEU90JezsjexFxB9qTJfqypvJkoX8
         oSGPhgA+5QhxJKDJ99I9vZMn4LDcS5l6M6NoqOX/BIuVv6QUUz/6UbjqvO3PMB2dG1Yo
         EfjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:cc:to:dkim-signature;
        bh=qgH+26K89KSR6AR8bguC+LVnWsiqTO1iWw375Q4mAgQ=;
        b=wPyjgZv8sCRczVo40uXXm9j7ist+wrHddlTP6sWkV7cLK7LN7PZ7xKlb/NZjztjQhX
         1QJ6oHvrzcy45piCx46zFzcGSZkVU/0UcZWl+xGabBQnniFMIUET5fUSzsiChr53+Qvc
         Frcaw7er5vHGqoZul7ezA8EKp7cBW1yBkRaxWZeei5DwrEjAu1Xq7IS5mev1vdOFswLc
         uYikvOKBmvrkLfMaaO12y4/RdrNBqxGCTkeRjz02Ko//sWAUG30b35gNkHdqGQhT4VgR
         GxqmX15tUpZk93PMBGSk9tzcP/7Nbd1DuDiWq0Vh/hXAjEeks4q9JTB0pym5+E2PHBHC
         3/Gw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=acz6ZPfU;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id v11si183418wmc.0.2019.06.09.11.58.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 11:58:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.43.205] ([109.41.65.91]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M0O2H-1gfkXJ0uGD-00ucDr; Sun, 09
 Jun 2019 20:58:20 +0200
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] arm: Account for non-compliant PSCI_VERSION return codes
Message-ID: <a9ac4f9f-8c5c-6133-b9df-77cf2a8ccc31@web.de>
Date: Sun, 9 Jun 2019 20:58:18 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:x4k8bHn8hRvdH0atqq44fURn6qsfQhYKb04xvjF4VItNb3f3k29
 fp/HOjjS2MEe6skDbNduTKeyI1bHD/QVQSZIylw+NAZweMDh1LK6UJmv0H5osCR0alCT2gf
 oe/HtCNiXtEfSxyh8/ssKNV4ucrCgOjaq0HoPIGTz2m7Siw7XgtV74RMuBGh+yMXO3mydF3
 mCNq2MFHPrsDQg8YA03Kw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hKwN4wpJvzs=:o2dLkFUmbrGVFFgAjIK1k3
 19X/jtwAdGdRtJEQlwumz0rcSj0J+EUzLZrI8EQH8L7qZumCSLSLbMil6LhC6hwzpFxQKs7Oo
 Vx44WB9ogNciuj0I+mt1mJfPFFhh1WuL4yvWTmLOB/xwTX+rN/e26EKl9gHF/NDzcgkF/pbvv
 KwbwzUVJzdpNZoNbDxKIUD9ki2Gav0x6fZoaXzJLRRhylLU5SKZ7EoY1ddxWS+YbhUOUAOyD2
 ROxgPfdkO9KuD3NWu6cnOpNvlfz3JJ6ZNPmZC7X6gK78YZCMUv/V8slp/lMav0DT4T9AKbhmq
 D3q1wlc1rimfn6/IhA+tJ6ZFyZ5t66oPlO90Ai1IsMV6CzSrDOX48n0l6nDdWSCa4AD4ZufCh
 SN9TIR6H5LlCsCPRd3FGN4moEESlOX7B1uzkj/8F+UYW/E9xCZ0DWBo1lIZshcP0pRn4OL4x1
 /+xyBsqgAXW3g/OPhB++TKp4lZSdAi7+sYCxJjQRHcRLiOlKgbsfCruvyrtvsVkjdbQfK4MmJ
 3n0Mmln26WCzjtdA71lVZEAybX4uxT3zU6WAve1cx1ygzYhy49Yns6imcu1sGkvXTyO5Xcefy
 rIFajDWo4IYbACvv3/nVGJogoEU/wL6YjDuQ3PjF8ShnWIRuopHbnWRhHPPtiQgZaOw0Z/K5l
 K0AB5L2jg6PS4iDoIUtt3bK8ayRPSmjGcCkTYZweNop2WwGMcMk1mNu/KB2FQxXT/W/rDOFx5
 VZl5Aop3oQNm6q/VPZ0qLvOZtO9TSVxL3xb2WPG1zEOBcIYKdLo4gSpaxA5nQW2mxxoOoJ5cb
 H//qoAQpzUDenQzeHiXNha4nQdY0ncITYepnocE4L8jgjgW8Q/+gIIxUvuZaTsw4Q8E/ixImL
 O5VGzBivdZpnrD3aVTET9aTNRSmaBSMdg6N3tz/vSeGW/xeHD8chjicGqqreednCnYQTm4bF2
 OMyu2YBr9q4t4+2jkowEAcNmwlOFgyLTO5I8rwqtJzFwuPweu+Umz
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=acz6ZPfU;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

U-Boot returns PSCI_NOT_SUPPORTED, rather than the implemented 0.2.
Filter out all negative return codes.

Fixes: ea924a3fec98 ("arm64: Initialise SMCCC backend")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/smccc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/arm-common/smccc.c b/hypervisor/arch/arm-common/smccc.c
index 5affa965..7734b999 100644
--- a/hypervisor/arch/arm-common/smccc.c
+++ b/hypervisor/arch/arm-common/smccc.c
@@ -23,8 +23,9 @@ void smccc_discover(void)

 	ret = smc(PSCI_0_2_FN_VERSION);

-	/* We need >=PSCIv1.0 for SMCCC */
-	if (PSCI_VERSION_MAJOR(ret) < 1)
+	/* We need >=PSCIv1.0 for SMCCC. Against the spec, U-Boot may also
+	 * return a negative error code. */
+	if (ret < 0 || PSCI_VERSION_MAJOR(ret) < 1)
 		return;

 	/* Check if PSCI supports SMCCC version call */
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a9ac4f9f-8c5c-6133-b9df-77cf2a8ccc31%40web.de.
For more options, visit https://groups.google.com/d/optout.
