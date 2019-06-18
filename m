Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBH5AUTUAKGQESFC5UHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DDC4A6B9
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Jun 2019 18:23:59 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id e6sf44459wrv.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Jun 2019 09:23:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560875039; cv=pass;
        d=google.com; s=arc-20160816;
        b=GMVajNv/NVj/GaC11ZpkMqHDH35mUDQVNsP7S8ZTmt7giwnx3xnUaVSTQDBZUOgVxL
         MHrdQBzrcPAOIwfj4wFXUc59qqn/8UXKfEOSa+ougM1tlucVgOyXOWhURJBliKeEU1qM
         34/bBXJ+Ewn8qpARfWbvtv6/iJXGK32NSRD/vr/FXP58K5FwXPA8cjWqM2W9oMq7qFH5
         ZzuWh8jDwBrBmHrZPtYMFX5kIw5PsXoXqB1wzYoYzysvcxzLTPT+XOzs9tZas6gzbt/M
         IG1dJDa+EcKyH6KGVJw48f4CiaqYClLlEeqfa05g/+pf0VdAi/lInO4ed8ivqNAWkopp
         /qog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=zmsjHMsevAE9DdI1K2t3vryPvbYtFGuwlyIG0RDGoPA=;
        b=Kk7IkUCZcoWcZw3pnDd7MASzsWKakWUpiu6aAHpTB3v4TJdDrD1Aut44iKNw3UupUi
         w6g+jvuI7ToL21k506ofxT9hU0T7wn/XD6sK2YgXhPjHOYowNYuNdQYvVNqojsijxc0A
         QysaCNuArNM/yJWv/AO/Nl6NPNhl3TAgxB/giwF0h0JvW6DvbtkuDZ66l9WENuR0TwHH
         n6bU+AbkY95fBLwY3a6zpd1Sc11KxXsT/U1/oGOWXiYnTtZygKsjmopheo4R/SEsSu8Q
         N+tjpZdJ7tmGDjYmrzn0HlHKewplfQknowZ7zJxSRfKSqJT3KY0YknhYVSgTaWdF+6zU
         GbNA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=fav2Lsi6;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zmsjHMsevAE9DdI1K2t3vryPvbYtFGuwlyIG0RDGoPA=;
        b=FKjSTGOhFw6ERQM9/I/BGgYk+R4686G2+bMnjQaNcpEETd1ujpn1OSyBb+ygmHe20Q
         DUKSwf4Gb0sGC1JHyUDhPW9HxuSzlq4zGTisv5YVYEYZcwZJzGY3TfhhQoEnFAItTqjw
         97d8pCpHR9QoOVelGTzxHu/+wCJ1VIDAPzaATeAYQVWEci95K1377Ppg2ZfxAYVG5SwI
         5Uz+kiVdUn+5tLn9gany5JJpoufX9udDNyBa7i6paMnQtf1bWrvHHbykcyiBmBa9yAfB
         A+V2Qw1ieHL8YRkmfWv7UFtHa4VgTwUgoijSPeR+1SzlSoQSJw4ekHQOHphVoe6Km22c
         qGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zmsjHMsevAE9DdI1K2t3vryPvbYtFGuwlyIG0RDGoPA=;
        b=KDjS7WJ2I2L7kdik71yNotvGb/fHvDhkqD4kCF0WhphnIUXVkUAmb1fx7e2Zj9c/N3
         SK7zXiW1xrS0bp8epU7pR6v/73EjHj31hX3hyrkgLTAg8mCU7bxH/pHB5gK4PC5wUAHG
         cu7NRXxnqbOqsEAASaHUhxSgcrKf+TAoevCkk4baD6c4tD4+dbAly+SJ4+RWR+3NxH+m
         NqVjxCo3Ex788bGINixGhUN6ALNyxkWq4hl5oNzcbu+TfgYSREPEwvqXt9R6S2r94R1w
         obbQVpW6jdp21JcZAaI8TAfZkPyQl83Va8QNnpDblM3QB5VNwWrokF9QMAWyekqVBOf5
         e5mQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW6P0oJtlEvz6lsVK3avdQnahhZKQQGWVidtWeR/DzYQEnXTks2
	urrnygaZBrgJHCgD4WhB6e0=
X-Google-Smtp-Source: APXvYqwQLN2JhX+E+QmEKCFfOvUb26oshltllWUPHJXnxaqXpyyH9zAPrsOzAHYyyuTCoUnqJwYTjg==
X-Received: by 2002:a1c:7e85:: with SMTP id z127mr4468377wmc.95.1560875039594;
        Tue, 18 Jun 2019 09:23:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a396:: with SMTP id l22ls3972322wrb.2.gmail; Tue, 18 Jun
 2019 09:23:59 -0700 (PDT)
X-Received: by 2002:adf:df91:: with SMTP id z17mr77205459wrl.336.1560875039187;
        Tue, 18 Jun 2019 09:23:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560875039; cv=none;
        d=google.com; s=arc-20160816;
        b=os9iP2h7/8L/U29xKHiIbV6KS96S8990dv7Z07Ij+V5o5JvrwOdaiNe8xs2H1UCXPd
         2JKzwsRAUpzlhavOQLABy63mI+s38Pl+FvYu7OsBAqwPkPBz/K4Q+Z9wg/ImszQ7kXh7
         cZfLP8f/Hnv5FjNlj5c7VAS79Ut3ARZLdvnSBkU4Bb9ZIb15RxFqzKQpFHk7s1zQmdr+
         Svh0kDpsJzlg/7R9QHQcr6/HD0LK1twSIS2URBu6g18UHoar2em3sLhVmBb07fXcs6YH
         e4+Vzzs1CN29tGn4tM+dKo/Rl9kqMzl4c7m2UEURGH4PVFlJjwG2ShYf4mYzOKI90+ko
         8uNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=Kn1NQM/xmWWPUe2bge8bNbyvh4P3jAYGSousIiE4zig=;
        b=QBxlM/T+em+sCZIy9mMCz5ho6E+v7NcMzrhMz79jEm0WRac1nDhOtW5cQ5FKpR1ySu
         V/Z3bs/gFv924EA4QoWumvAPPB5KfSlFk75R6VB2F9KCb8egMdswYyMVGsKw3VKY4lvi
         JmuXZxMlzaNW9lyY0o3I0ok5bh+txUp6MBuhLIMy4BBTAk0IDOU//0PqLIueCPKH1Sco
         CyLb9m1LuQd/7hZpHpLLsrdFoXNdI6z6NLoZSBJIv78MwU4zpl/LviNKcf9/tWa7gLAR
         jkrC+s55WCNZNqyDwYUSE9F9nNsaiCOIgYDe8pw7ejAOy2XwqZB+igK9/mHiyS5TV69Y
         lYog==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=fav2Lsi6;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id z11si101102wmc.2.2019.06.18.09.23.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 09:23:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45Stgf5KfxzyHh;
	Tue, 18 Jun 2019 18:23:58 +0200 (CEST)
Received: from [192.168.178.79] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 18 Jun
 2019 18:23:58 +0200
Subject: Re: [PATCH 2/2] pyjailhouse: x86: implement pio_bitmap generator
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <20190605161745.2389-1-andrej.utz@st.oth-regensburg.de>
 <20190605161745.2389-2-andrej.utz@st.oth-regensburg.de>
 <1facd54e-88f5-b3c0-91e9-85a2aa821245@siemens.com>
 <8d1f8f9c-8cdd-e4df-acd3-cecff65a2612@st.oth-regensburg.de>
 <54068680-fcce-6738-d5b5-775cebb24e6a@siemens.com>
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Message-ID: <0b53c6d6-1810-fe2f-f077-20fe8272ff36@st.oth-regensburg.de>
Date: Tue, 18 Jun 2019 18:23:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <54068680-fcce-6738-d5b5-775cebb24e6a@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: de-CH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=fav2Lsi6;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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



On 18.06.19 18:04, Jan Kiszka wrote:
> On 18.06.19 17:55, Andrej Utz wrote:
>>
>> Hi Jan,
>>
>> On 07.06.19 09:23, Jan Kiszka wrote:
>>> On 05.06.19 18:17, Andrej Utz wrote:
>>>> This replaces the old static port list with actual port regions from
>>>> '/proc/ioports'. The static regions from said list are kept and=20
>>>> override
>>>> the data in case of region overlap to retain compability.
>>>> The generated port list is virtually identicall to the old one but=20
>>>> eases
>>>> manual configuration.
>>>
>>> IOW, the whole PCI IO space remains accessible, is now just=20
>>> partitioned in order to ease manual disabling? I wonder if we could=20
>>> not go one step further and only allow known regions.
>>
>> But isn't this the same as the static regions ...
>>
>>>>
>>>> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
>>>> ---
>>>> =C2=A0 pyjailhouse/sysfs_parser.py=C2=A0=C2=A0 | 135=20
>>>> ++++++++++++++++++++++++++++++++++
>>>> =C2=A0 tools/jailhouse-config-create |=C2=A0 14 +---
>>>> =C2=A0 tools/root-cell-config.c.tmpl |=C2=A0 15 ++--
>>>> =C2=A0 3 files changed, 142 insertions(+), 22 deletions(-)
>>>>
>>>> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
>>>> index 56265fb5..d06a476a 100644
>>>> --- a/pyjailhouse/sysfs_parser.py
>>>> +++ b/pyjailhouse/sysfs_parser.py
>>>> @@ -142,6 +142,57 @@ def parse_iomem(pcidevices):
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret, dmar_regions
>>>> +def parse_ioports():
>>>> +=C2=A0=C2=A0=C2=A0 regions =3D IOMapTree.parse_ioports_tree(
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IOMapTree.parse_iomap_file=
('/proc/ioports', PortRegion))
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 tmp =3D [
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # static regions
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PortRegion(0x0, 0x3f, ''),
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PortRegion(0x40, 0x43, 'PI=
T', allowed=3DTrue),
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PortRegion(0x60, 0x61, 'NM=
I', allowed=3DTrue), # NMI=20
>>>> status/control
>>
>> ... do here? Or how do you define "known regions"?
>=20
> There are a number of known platform regions in the lower IO range, like=
=20
> the above. And then there are the IO regions of PCI devices, according=20
> to their BAR settings. Currently, we permit access to the whole PCI=20
> range to the root cell.

Does that also mean we need to read the PCI config space to whitelist=20
port regions?
If so, I'd like it to be another commit on top of this patch.

Andrej

> Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0b53c6d6-1810-fe2f-f077-20fe8272ff36%40st.oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
