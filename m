Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB7ORTXUAKGQESUB2UXI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F2A47F79
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 12:18:38 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id a11sf4486877wrx.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 03:18:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560766718; cv=pass;
        d=google.com; s=arc-20160816;
        b=ezBuyN6gFjRZOMKrqUa0FrENj3rl4lUctG77EyyXqWgAQrrrPO2GUexPw0y0EsTdWD
         evzEV8PRpWNun/4oefw23z5XAg+YN/cpVZGv9ZKc224RMSSA3kowr4Jwrnh9+BGCr6K4
         TgGLaxpmv19jCwr3tNwSeGLI9hRaD+u7BdiAq5lH2gB+HmnB6cThB3V5uqHkAlOWfe6n
         vmA810YEIe+jQUIiLn6ntOXvR5kEZYx10zls9D+WrrZRatkZlMemS7XFHO3v+ttzV6wo
         wn3iZz2lrIHGYkXztF897o/OOUBH1IKH45zRw58oxVi+Hor5Y2Gvmqj9lkMuIe9tipXw
         ZC0A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:sender:dkim-signature;
        bh=CQ8KjNfksLqM3a5HmMGulLaOw4ezaVUNxAIMxAvaRgg=;
        b=txpVjVhR4HLd7MEVeQmREves3OjW4QQ8HHEP6t9oJHa+xnZPV2FiHX+ikMOP3Hs5vJ
         ED9knWkYrXtN/rWExge8pbEMC0fAMFlFItmZ2uTFA/rUleqZIt+5gfOJi1ED9NvqBfIc
         NGlgV8nZqse0aE57R98FF2Elq75puOwSS6yyr5ZL9b249FIAIgqH2VLrrgoCfVh+fHZb
         HegxecYxd5pNqG8u+rK4Q7xGpv3ah6wPS759sE6i0SfPuE/5zBH9FeVnXiGe0Yq6D3H5
         i9VFIdiQaZd2SQYb+KTRrHgFhGUIFoXd8PRtK7/8BYJzVlem7DhNOexNAVE3rtmQMo3f
         uVGw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=ByDhY2Q9;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CQ8KjNfksLqM3a5HmMGulLaOw4ezaVUNxAIMxAvaRgg=;
        b=huF493N/03/A3rwiEMlaEFFlAtljlnl5G8FAf5WXEhYoS4RHLObDPazPgq9VfrUmCf
         A2ds75OVH5iaYa39kFUmjDL/GHmDldUCMBR83F5qLdp5xrlu52NzzQoK2g9yEEXjjLQJ
         CIUtaRgV2HTtcMZNkChO5juVjKHwKhm6e/5j6L4NWHvc/dLyA4qRDtqnN3maynHijgxl
         l1UoK3UmoZchziiqqrSQrBpbksya6OmnSbqfzyV9huacCEO13WMItAm35ntYbPogKsFE
         nnB1g70pibbzS/GMoz3OWij6RQI7W3eRNRWatObHsXjPjfGSkB/kUy8mXPBAOl774YsX
         i+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CQ8KjNfksLqM3a5HmMGulLaOw4ezaVUNxAIMxAvaRgg=;
        b=fgco7H3uEpquHh6P6Yna3cg5mdEPd7lwNVkIJDJ8qrXFjnhJnzrh2N9dqXRy6HUkBE
         qrqLKopZ/7BZ9spXku+IHaxlbldk+2z3Je01LgqIe/1DOZ5SPsLYbaeXlRAD6U8xmm3X
         QqHtrN2bg34BoGNxCtHbCkMag+RVkDTGQOo6eFuWwhPso9gRlD60vhHNPrHz/0QUwgfw
         MtTr2tkLI1IOeqhpoNGD6uOUmSVZ8AztTFS8qRyijo4qnY3HFmGq3aBJ0fclp7KcukW5
         Bv1Dlp47b1LsU3PlqaCKq/UPaEQoOxKA6zXOIPNQ4kcuDyVroXC3MeBhWCW77a7NRM76
         Bl6w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW9GD/IcdEVheXXAXnxXntbqu4VVljBnxh6LWZxKWVs49x95Bh2
	gTSnQwp+BMYRFaRRy3IvFQE=
X-Google-Smtp-Source: APXvYqxGlPWhrbrxPw00Z1QWXiC3glNGudlIgaewETK4qvSkBydoA4jSvUZHgvdN3qSZYdEjM+kuaQ==
X-Received: by 2002:a1c:65c3:: with SMTP id z186mr19102704wmb.116.1560766717856;
        Mon, 17 Jun 2019 03:18:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:2295:: with SMTP id 21ls61143wmf.2.gmail; Mon, 17
 Jun 2019 03:18:37 -0700 (PDT)
X-Received: by 2002:a1c:f20c:: with SMTP id s12mr19285871wmc.151.1560766717168;
        Mon, 17 Jun 2019 03:18:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560766717; cv=none;
        d=google.com; s=arc-20160816;
        b=COo2S+H0fGogUImy+sUEyMgh6S1bdNtAPsZJccs7Z8nSKKPGoK9ECyd/eQPnOIGNUy
         7HlbPs8Mg2Li2kl8OxLJsx1EsA/FeZh22glO1IoIvDxwlRcl+JKrwQOAMPFBKsDE/hO+
         URmwd58wYyhCPzQ5V4guPt1LhKFQ0ycRruhLDONJ6wYqr+YqmAXYwQdWEJBe75g5xKYL
         KYbxOJKu88gMLgXCKpsjbI5cvg98+TnDVlxE1wekDHoz/SojNR7ybghE56Xjb45DS7Fm
         jqLgth1UWt8C1PjxEtETQrgwe9BnI+X/imSEraXkQisuK99AzHs6RRuT1uBkCCX6RmII
         +VNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=0aHT7h4COLa09h62ro3MMFXqNk/nyXY+lSOmD0QxiZI=;
        b=MQhVt3Z8ULYA+kxQLE8gQ8UbTFoj3tnI3IF8Q18VA+rjXwxlOUxEmY8KIKWMyzAJKz
         rL2Q03EZg+zF5UHPh49CXI28b1MTWMq9s3/JO/wjo6JyQvcoJbZVNwgTpcuUW8Zdangm
         fICL1dr8HkPvR7EaBja53tz/PV5t6ENKyCH3RPKLNsT87pU2xZXs4sE110mZAVyQDTA8
         lN8U5tFaKpA+7TFxkwFIOy1ZDFQIvgYzFiXJR+YGBPerDNClACiBrSsqZDMCrkR8czYv
         IBXmnIoAD5jPCRFNMQ8ZAnfWQWsrETSO6iSWL0TJI7/sz+oJPQ62ENm02an0+WT+AEcR
         KQvg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=ByDhY2Q9;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id v11si697710wmc.0.2019.06.17.03.18.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 03:18:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45S6cX5XndzyF1;
	Mon, 17 Jun 2019 12:18:36 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 17 Jun
 2019 12:18:36 +0200
Subject: Re: Finalizing 0.11
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>, Andrej Utz
	<andrej.utz@st.oth-regensburg.de>
References: <9a1a19fe-57c5-a5d2-f5a3-547e07bbcf8b@siemens.com>
 <e7496701-fcd6-8c8b-ee43-84245c782943@oth-regensburg.de>
 <dd35885b-522f-3291-0c53-297e2d2d980d@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <464227aa-f75a-9823-772c-de19242e8576@oth-regensburg.de>
Date: Mon, 17 Jun 2019 12:18:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <dd35885b-522f-3291-0c53-297e2d2d980d@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=ByDhY2Q9;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 6/17/19 12:15 PM, Jan Kiszka wrote:
> On 17.06.19 12:11, Ralf Ramsauer wrote:
>> Hi Jan,
>>
>> On 6/17/19 9:49 AM, Jan Kiszka wrote:
>>> Hi all,
>>>
>>> by the end of this week, I'd like to tag a new release. If you have
>>> anything pending that should be included, make sure to post it soon. My
>>> integration queue is empty, so also let me know if I missed something.
>>
>> Andrej still has two patches in his queue, but they're not necessarily
>> required for v0.11.
>>
>> There's still the MSR bitmap issue on AMD64. Valentine didn't respond
>> yet, I'll have a look at that soon, it's an open issue that should be
>> fixed.
>=20
> Let me look into that.

Ok. (Maybe that could also be the issue why apic-demo shows implausible
timings on amd64)

>=20
>>
>> Other than that, I'm in the meanwhile pretty sure that there's something
>> odd with VT-d, but I can't yet tell what it is exactly.
>=20
> Do you need me to write an instrumentation patch?

Maybe. Let me try some other things I wanted to test last week.
Otherwise I'll return to you.

Thanks

  Ralf

>=20
> Jan
>=20
>>
>> =C2=A0=C2=A0 Ralf
>>
>>>
>>> After that release, a major rework of ivshmem device is scheduled. A
>>> prototype that supports multiple peers and has other optimizations of
>>> the previous "ivshmem2" approach is almost ready, just needs patch queu=
e
>>> refactoring.
>>>
>>> Jan
>>>
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/464227aa-f75a-9823-772c-de19242e8576%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
