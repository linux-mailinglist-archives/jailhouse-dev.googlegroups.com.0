Return-Path: <jailhouse-dev+bncBDOPPN7U7ANRBCUKQ6IQMGQEGWZWMWA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x740.google.com (mail-qk1-x740.google.com [IPv6:2607:f8b0:4864:20::740])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA1D4CCF47
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Mar 2022 08:51:39 +0100 (CET)
Received: by mail-qk1-x740.google.com with SMTP id m22-20020a05620a221600b005f180383baesf4956552qkh.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Mar 2022 23:51:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1646380299; cv=pass;
        d=google.com; s=arc-20160816;
        b=UhghLnCkHk9dD4mu0tPUtfT29aUw3YIMjj/s8wN0NFpBLva6nTknylzorgInFi++fw
         FgXZ5qoSyY2iazOA0ZIBSAFiJtPpIkekMoNYNzsikdJQ7Lsol9/6sVaPpbLmq/V6OTNY
         vmTxmOLR7OZ5cIK/UUEyIZXSvaxSV9vSD7+QGp21YYBKTX8UdWSYra6NHbpYGpk8odLw
         Ow79eszJt/CO2RuoKdHpWNCWkCoraQWHthTz9Z2ihA4m5V4NCopdH9N7cukMvsi64kuH
         /fS9gzfduhGeCSjoJlQgijy9qAnB+lugXX8z+RKdzC6t6oI4waT9KR6HiY+X8FV3cKLq
         OVWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:dkim-signature;
        bh=CzeoCMRksg5ilb8i6EZQj8QFY6hQwRi8wUjZeAR8oNg=;
        b=RDigv1TrqwLzkEDBgF0lEoB7A8P5ebHg7ShFuA1gvCMerImOSNP4FxIuWp67F1LSzh
         ZkA2TOLJncYOolg3BzKn4+jhURv0uOyJmQR9Pcdp7xVyXbQtrghW+C/JBEBz0jKOllQn
         z+IcPAW4WeMwMNVpchwDEIYzxcV4dgxb7jBYgG7Svf0mB3uxK1RuiskOekqzplIWdn4A
         vsDMjN6+EVpra9Iq3rEvci9QVkApzxzuaHgUIZbbDWf7hOwmpvG075755Q1VPFICzk8P
         LImlx+8q7nzdnnI3ylGBJh8tFPyQqM7mH2l+QGfKVBK+IMetbljjDjPC0dCtOrsMPxWe
         pINw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NCt9zlOb;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=CzeoCMRksg5ilb8i6EZQj8QFY6hQwRi8wUjZeAR8oNg=;
        b=sB5geUa2SdWJKu2lQTA1TLTd/tXWSSPJHzwzOigo4WtoHO4hQdWOE4w1fndrNCYJF0
         OqjUS0OwVlQJHhwKTE34S8ZYXCso4Gp8+zTlBrHN7XhiQyej4nRvRuPmR/rXkeVtEVHS
         NG62gHH80g73u42JYJMklFWynAfTvxSibfAO7fdAExcqbeByIiH7RfZKy+YE3FmavGtZ
         978QE+AjJEYfYokIAZHNjxC8IUza6ASAfUZzBXhsePku99zEiBifLKpxkGnmNH+E6q87
         tgYlNdkyvlqkkWCXnhFXraF7aDtqZNYee/6xLLY1sZPO+XQXr/bX+dX3L/3BE44iYw8a
         jPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:thread-topic:thread-index:date
         :message-id:references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CzeoCMRksg5ilb8i6EZQj8QFY6hQwRi8wUjZeAR8oNg=;
        b=xNChkEy3nsRzDW0t8s/Qtk1fO8BIwWCRNyvg48qf7lO8c/fDozu4rHOKLO3W95q4/y
         E4/U4A0OjTkM2qgq4UzhuAdW91IQvBTg50eY8/64aTJ2CJYTMegR8xsH2m8Hdj+hpVw0
         xv1TzBWeEh+VL6l6k89E0Y0f011SIpPyx3hsdkO+u5SI1v5UP+DhQ1bIBpHR4Mfogn/a
         AyHDnsdV1BYz1y88v3uo2ZecXmgfuGWTFXr5l2JZo8+Utz2q963XceIhO8kbivHhXeXA
         NCmeo19UHl9ZrHsyvBkt3jjcC6Da3WgpuNMa2WCvgoP5bTA4n9A68DdxIvSfsKT3YTvw
         BGng==
X-Gm-Message-State: AOAM531VhW2D63CtI6G87UxB7p6KUQYgU2RkD7Jv+M0uwArTwlHDBePe
	yXGipyzs4Tlcdw/2djOCbTo=
X-Google-Smtp-Source: ABdhPJyVe44KbIrYCK2ODbjyKBtxov74b4vSN+EDKrs9uLyjusOoC7iqIaLwAQtYBAZ107trODMDtw==
X-Received: by 2002:a37:2f06:0:b0:5e9:83fd:7cc7 with SMTP id v6-20020a372f06000000b005e983fd7cc7mr1747346qkh.207.1646380298803;
        Thu, 03 Mar 2022 23:51:38 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:622a:5d4:b0:2d0:3e30:18a4 with SMTP id
 d20-20020a05622a05d400b002d03e3018a4ls2828910qtb.7.gmail; Thu, 03 Mar 2022
 23:51:38 -0800 (PST)
X-Received: by 2002:ac8:5a0a:0:b0:2de:b81:24ca with SMTP id n10-20020ac85a0a000000b002de0b8124camr30598162qta.271.1646380298036;
        Thu, 03 Mar 2022 23:51:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646380298; cv=none;
        d=google.com; s=arc-20160816;
        b=CXt/qGE0hAb4IoCY4vw63GYEohIBguBW/YKJ3UPvVlpNbVKG7fNbg6jfo3NsHuFUMY
         n6QAm4T9OXugePZg1RtyQuxVATSpqhdZePdfM3UAPf8Ngnplk7XgyZHw826mk1LRmNKM
         zZhP5e/XTmWsaVMb+mNFzP8e8eBH/9ajXOsXKQnhuoEFhzDsUO5FwrM4RzpetlFxx0Jd
         ZzPhZ2TZlL+fp0DE/GrvkPFsnCAuM0j6zJ9jZdRb1WmR0SQsZW7PXI1nt2zmoK+6d+5t
         9mLtCd1Hsh39r0tTBkJWSvh1jr9nTSc/0GbyZGSJCRwZaGMIpypNATWuR2El4gAiP9rX
         w0QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=UERkL9XA9OfjTH7OJR+fOfRTfi+6etgRwaAk91ZElVk=;
        b=jt8vIPbxLhZGol/lR0TPM1+n1/Dwap4tEbwrZkzqww2vMOgt/+sbz/dCG6aqGg7HzB
         vQXZkGukxfUmtbbanYB0v/TREo4ocVV10BDpl5RAvMZ1ZIB6cr+Ai72LSAt1eyrhRyLm
         pHRKwidWMztlAN+Tij2FjFihycfY/Z/DNdiddi/zgwkpL5mXDX/86wh3GhV4DlpgbI2L
         chQS+EWDLDunnsc2cE/WM6Dx90n+mtAXQgM0XbbLHieqXrfmo01/ZOlQMaTBn8+XNcZq
         voGI/BSvohxb61ntmjQUr2FZb67DRrVA3qFDOf4/cb8mwwSYlLZ+2q3znmRws7tmFaDP
         QZKQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NCt9zlOb;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id p6-20020a05622a048600b002dcc2269cc0si128244qtx.1.2022.03.03.23.51.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Mar 2022 23:51:37 -0800 (PST)
Received-SPF: pass (google.com: domain of mranostay@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2247pbr8090963;
	Fri, 4 Mar 2022 01:51:37 -0600
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2247pbcd090769
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Mar 2022 01:51:37 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 4
 Mar 2022 01:51:36 -0600
Received: from DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12]) by
 DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12%17]) with mapi id
 15.01.2308.014; Fri, 4 Mar 2022 01:51:36 -0600
From: "'Ranostay, Matthew' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>,
        "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: Re: [PATCH 1/4] configs: arm64: add eMMC support to k3-am654-idk
 linux demo inmate
Thread-Topic: [PATCH 1/4] configs: arm64: add eMMC support to k3-am654-idk
 linux demo inmate
Thread-Index: AQHYL23dmRRw+6fHG0++56NrM3145ayvKikA//+vDgg=
Date: Fri, 4 Mar 2022 07:51:36 +0000
Message-ID: <e3fd76521d2d45828072a6430c232403@ti.com>
References: <20220304021615.2862-1-mranostay@ti.com>
 <20220304021615.2862-2-mranostay@ti.com>,<c8697abb-27a5-6560-513c-067c4d32c389@siemens.com>
In-Reply-To: <c8697abb-27a5-6560-513c-067c4d32c389@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.248.242.15]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Original-Sender: mranostay@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=NCt9zlOb;       spf=pass
 (google.com: domain of mranostay@ti.com designates 198.47.23.248 as permitted
 sender) smtp.mailfrom=mranostay@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: "Ranostay, Matthew" <mranostay@ti.com>
Reply-To: "Ranostay, Matthew" <mranostay@ti.com>
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
Sent: Thursday, March 3, 2022 10:36 PM
To: Ranostay, Matthew; jailhouse-dev@googlegroups.com
Subject: Re: [PATCH 1/4] configs: arm64: add eMMC support to k3-am654-idk l=
inux demo inmate
=C2=A0  =20
On 04.03.22 03:16, 'Matt Ranostay' via Jailhouse wrote:
> Add eMMC support to k3-am654-idk-linux-demo inmate which requires
> several device tree changes, and addition memory mappings open
>=20

And what does the root cell use then as mass storage? Normally, that's
where the eMMC belongs to.

Matt: So the SD card is the mass storage for the root cell in this case. I'=
m okay with making an additional inmate configuration with the eMMC change.

Jan

--=20
Siemens AG, Technology
Competence Center Embedded Linux
   =20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e3fd76521d2d45828072a6430c232403%40ti.com.
