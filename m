Return-Path: <jailhouse-dev+bncBCK5J67X4EOBBENET3ZQKGQE4VDRZXI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AB217FB31
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 14:11:46 +0100 (CET)
Received: by mail-lj1-x23a.google.com with SMTP id a14sf1977831ljj.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 06:11:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1583845905; cv=pass;
        d=google.com; s=arc-20160816;
        b=vg/ili0T7wjB8vY1Ln4P+xNFGSCEgT5SgVpDH5qmORB3hDnvEsqbDy5EZw7v+NRfYY
         hEpgdPiuEkV0nO/TbFfPuQ6X9b5dkNi3WXEi8JPYvV17/5PBmoAkyfvuAdyFBy3rkhjY
         AfJbEXk1ETCjtlbO/u6HYmVOkUg65XVOR9+icrhumgbn3TShtpzeyFbNhKPGROdAxlQV
         8E0IjG5OiR9YeWdD1jZPxNeNmZTdyDXOJUuJ7OMu/g4NCX04BwVvP2mrnuvreBNeZ18l
         InyP6C7G6ou3Tsv9FwV2+1W5Z8fhr6Voey4LQ+FrhTMkheYfs34riYnZ6QedO312xbBj
         nGNQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:sender
         :dkim-signature;
        bh=ySR0HAsPEprlz1egvb2FdVwKmgK9aJnWghgN/ALeEtU=;
        b=Gom/dAy2CS1Sa5ul01dFkqyjIM4KEAr3eqK2jrJRMa1W9iNI79RZtanENonKwpVqeZ
         xR71YSV3D/PYjpmm4+T5Sb8ZwYWgcf9K9HGcBsmdUnLGA3qM4EgMeqDwzWZh2D8avEVW
         b6Glh+8D4rytWbXcCnbobfUHylFeUsoPk/Kl+QQLnq2WMEJJTnvp9jFQBYl5Y3lo1G59
         i10ReYcD5Qt/XuiGXv6xq+03VgKPOU8mL6KN0Bmv3/hNU4cSeqi0OpXn0MzdTfD9a9xR
         b8AiGU1lhvHo1dkqtDODjWFrUCyCucQYIes0vbDibAU+jQR4CQHGcB3VvkMc7yKRNm2D
         9xCw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=neutral (google.com: 134.106.51.109 is neither permitted nor denied by best guess record for domain of patrick.uven@offis.de) smtp.mailfrom=patrick.uven@offis.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ySR0HAsPEprlz1egvb2FdVwKmgK9aJnWghgN/ALeEtU=;
        b=OzOTxs+obn4+xrUD9/w+tvhE+8rVtPVgAEeOjiUjU9yJJpwyw+ldQwu1ZUldaMxzR5
         vsmo/TuIiBj8mVriAkNHXhW6a9buySRnJ3UUcoq83lDl9iP3BSu24I1Mjmg5CRBHvR+E
         TBpnqJ6J6NXfqm0q43facko96TnMlUid9FqImdQazQV943PUvktxGz2/CKg5wegli2J8
         upBfFal8s4Hvo/fR7kiF+7GU0/W+Z+tEB0qsYv839+TVCjFFHMPccoDcOPn1uzCuQIcF
         PebO2MbXEZjlHN4WV1nmAj0c13syAbEDTjUxkRor3LuB8FGzzjkG9DvWxLVNZ/WLhyG1
         l8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ySR0HAsPEprlz1egvb2FdVwKmgK9aJnWghgN/ALeEtU=;
        b=pp1y2Yzf9g9jlXgsgLSol14Wrk+ceKPluJPqz/3U+GHUqTJLzavC+zuwMKrzviUsFI
         hXYSjXaXxOla12TEL/l2hY5ioG7AwTttW40+yesWlIwdrkkrRrihYURAFu68NXs6X0Kk
         +FbCWBKO70iCEXXUxuR2YeyxwD7CPWHm0d2uMFeVoR9qpTeAULtQUxFINvggUAmEPHii
         P1wVxYCa++PnsMDl+Am0DTm22TkEUnpILS7ya72mPKGLv5ltp+f3G9eeMHgyM5iye2Ny
         vWhaJYefmknxiWNYUv0ruuyXSWjbM5DT88+sDf/xjN1yi0+p24l90p1TvnaLSdIVTdeh
         GW4g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ1O2AVmrEuBGsBf34sZOjj8G8CiRhGWCcf7QOICxixk1BmD1EUh
	f3UqV1QzPPZ17wl5izcxSp0=
X-Google-Smtp-Source: ADFU+vvlcqvvDZfJKqvDuP20t4b7s27hdLKdbhE1Uvt4c+x3ub8ZbVlrkPXC9uq6cE45CauVZIxB/g==
X-Received: by 2002:a05:6512:1042:: with SMTP id c2mr12157780lfb.6.1583845905593;
        Tue, 10 Mar 2020 06:11:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:686:: with SMTP id t6ls1819405lfe.3.gmail; Tue, 10
 Mar 2020 06:11:44 -0700 (PDT)
X-Received: by 2002:a05:6512:10cf:: with SMTP id k15mr12961815lfg.142.1583845904788;
        Tue, 10 Mar 2020 06:11:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583845904; cv=none;
        d=google.com; s=arc-20160816;
        b=YmnjlfSphdEM4j6+tZoHbCKH45gJpdM/1dyjS8dcWKZUwt9Sw1YXOFzVZL7hQ28bTR
         YkZowqziJDrnSZ/neMT9y1vC+7RkHqH8ukkaqV7RKAo8akCIswrZUv5Pka0l+RAYgoTc
         wr2ve8E3mfKSIYCCxr8H5FjNdz3W+YcbEPhq0kY0HmFkB38BIBJKNg1gFYPYClFehlNt
         fuTW5cYWBm16GR/FfFV4x3L8psnX5U+wlZ8LxsqpO1w8x2liXN9wLcSucTVXu+HZj+Bm
         7Ogyh1a9m1qfFsRDygNe+HDEOle6KgZPH8pf2FqE8SG9OmdxwgFMQfbCsPnrYhf4zHkH
         d+oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to:subject;
        bh=tBZNzNJwfretz0YbJnaYwpAZ/NpitH9+X9ASLVCLI2g=;
        b=ocqH2W1ztmjcOUjzjkZ65XkEUNNfkcURNXAVKOrgDOBFsKnS0mSRoN5NIJ8ryPxlPp
         sLw8DgdC8VRWt5/XSf07yPJ2VNlz7d8N/r67cfXNIsIITbbr6JY3RJdkVnj3RG59gBjL
         f3QaEU09+/zvCy2J47yX8xUqKpcd9Z9zfTTfk+DiSChdgpyt4LEso1zDWkSYwdu4QKBI
         ayDOeim/lfYBv0mZ+R2agw88Mfd5W1Xg8j5hnqW0ceD1NpcwieVnQwnSvs8YZ7pqdL2W
         iLwhs1dp1+ZERErA8GBQrvC+a2U6Albr/EqAlJS9lXQ2TTpRgPVaEtWnAYjrXX5RMWDu
         prcA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=neutral (google.com: 134.106.51.109 is neither permitted nor denied by best guess record for domain of patrick.uven@offis.de) smtp.mailfrom=patrick.uven@offis.de
Received: from offis4.offis.uni-oldenburg.de (offis4.offis.uni-oldenburg.de. [134.106.51.109])
        by gmr-mx.google.com with ESMTPS id r6si746943ljk.1.2020.03.10.06.11.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 06:11:44 -0700 (PDT)
Received-SPF: neutral (google.com: 134.106.51.109 is neither permitted nor denied by best guess record for domain of patrick.uven@offis.de) client-ip=134.106.51.109;
Received: from localhost (localhost [127.0.0.1])
	by offis4.offis.uni-oldenburg.de (Postfix) with ESMTP id 0F86338127D
	for <jailhouse-dev@googlegroups.com>; Tue, 10 Mar 2020 14:11:44 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at offis4.offis.uni-oldenburg.de
X-Spam-Flag: NO
X-Spam-Score: -9.999
X-Spam-Level: 
X-Spam-Status: No, score=-9.999 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-10, SHORTCIRCUIT=-0.0001, URIBL_BLOCKED=0.001]
	autolearn=disabled
Received: from offis4.offis.uni-oldenburg.de ([127.0.0.1])
	by localhost (offis4.offis.uni-oldenburg.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SFDSL80hTDrz for <jailhouse-dev@googlegroups.com>;
	Tue, 10 Mar 2020 14:11:43 +0100 (CET)
Received: from [10.3.1.60] (ritchie.Informatik.Uni-Oldenburg.DE [134.106.3.254])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by offis4.offis.uni-oldenburg.de (Postfix) with ESMTPS id CA545381279
	for <jailhouse-dev@googlegroups.com>; Tue, 10 Mar 2020 14:11:43 +0100 (CET)
Subject: Re: Jailhouse TX2 and GPU?
To: jailhouse-dev@googlegroups.com
References: <202002281443.01SEh8Ta028765@opswc01.bsc.es>
 <6a16a1eb-a0d7-da01-848c-107b56c6f114@siemens.com>
From: Patrick Uven <patrick.uven@offis.de>
Organization: =?UTF-8?Q?OFFIS_e=2eV=2e_-_Institut_f=c3=bcr_Informatik?=
Message-ID: <96ecb1bd-8761-dce4-e20a-d008e4b9dab0@offis.de>
Date: Tue, 10 Mar 2020 14:11:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <6a16a1eb-a0d7-da01-848c-107b56c6f114@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: patrick.uven@offis.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=neutral
 (google.com: 134.106.51.109 is neither permitted nor denied by best guess
 record for domain of patrick.uven@offis.de) smtp.mailfrom=patrick.uven@offis.de
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

Hi,

I would like to continue this conversation, as Alvaro is most likely
working for the same project I am.

On 2020-02-28 19:58, Jan Kiszka wrote:
> On 28.02.20 15:43, Alvaro Jover Alvarez wrote:
>> I found very interesting your work in the jailhouse software. I'm
>> =C2=A0=C2=A0replicating every single step for its integration on the Teg=
ra TX2
>> and so far I got jailhouse running bare metal.
>>
>> Now, I was wondering - what is the status of the project?. Did you
>> ever manage to run anything inside jailhouse inmate using the GPU?
>=20
> If you completely assign the resources of the GPU to a cell, this should
> work. But I don't have a TX2 to try that out. Adding some folks who have
> some in their labs and maybe tried that already.

I was able to create a few scenarios which all did not work out as hoped:

0) Using the evidence port[0] of Jailhouse 0.9 for an old version of
L4T. While this works, it is obviously a quite old version of Jailhouse
as well as Linux (4.4). Is this the version you were using Alvaro?

1) Using the newest version of L4T and the provided kernel I was unable
to build the newest version of Jailhouse. As you already mentioned in
another message regarding this topic, Jailhouse tries to restrict
support to mainline kernel wherever possible, so I tried that next.

2) At last I was using different mainline kernels on the TX2 without
much success. Trying versions 4.14, 5.4 and 5.6-rc5 I wasn't able to get
much more than a booting Linux which a console via UART. No HDMI, no
network (not expecting an answer here for those problems, just
interested if this should even work). Using the LTS kernels Jailhouse
would fail to initialize (when using jailhouse enable some CPUs fail),
using the latest RC I was able to enable jailhouse, but ran into memory
errors when creating an inmate.

So overall I wasn't able to get a current Jailhouse version running on
the board at all. While I guess we can ignore scenario 0 and 1 as they
are out of scope of the current Jailhouse development, I wonder if there
is anyone that can confirm that scenario 2 is working. I'm not asking
for a step by step solution, but just getting some information on a
setup that should be working would be nice -- especially if the GPU is
working in an inmate as well.

Regards, Patrick

[0]https://github.com/evidence/linux-jailhouse-jetson/
--=20
Patrick Uven
Researcher

OFFIS e.V. - Institut f=C3=BCr Informatik
FuE Bereich Verkehr | R&D Division Transportation
Escherweg 2, 26121 Oldenburg - Germany
Phone/Fax.: +49 441 9722 425/-278
E-Mail: patrick.uven@offis.de
URL: http://www.offis.de/

Registergericht: Amtsgericht Oldenburg VR 1956
Vorstand: Prof. Dr.-Ing. Wolfgang H. Nebel (Vorsitzender), Prof. Dr.
techn. Susanne Boll-Westermann, Prof. Dr.-Ing. Axel Hahn, Prof. Dr.-Ing.
Andreas Hein, Prof. Dr. Sebastian Lehnhoff

Unsere Hinweise zum Datenschutz sind abrufbar unter:
https://www.offis.de/datentransparenz.html

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/96ecb1bd-8761-dce4-e20a-d008e4b9dab0%40offis.de.
