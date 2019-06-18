Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5VCUTUAKGQEPV3Z4FY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 6123A4A6E1
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Jun 2019 18:29:43 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id t4sf61628wrs.10
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Jun 2019 09:29:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560875383; cv=pass;
        d=google.com; s=arc-20160816;
        b=dwmXY7yAlPJ0UDQm4ALehnIQ9/IABAj2qasDmr+I1meAQNr4PXokLubNF0zLddVEHR
         8X8uMnD4kKq7dFCBdYOZstj8LnOaPP89jFIEOeqnEUhp9ipckEEbpcrxdgC8ZoRW42aL
         aT8Ol2UuqB2THbWj9tS1eM3StcfMYClYkN3TNpOyzy/0n33IbS24edPkurxMwMfZqh8c
         u9dhVnxWnc0dEUKbfBqed/i6qgXpP0aeKkayYN2Xb/a6m6/l7K1cWvcYFqp+6oDjvPC2
         kyM4Uy1epLRu+VTi9Q9KvHkpkTcMfXbG9HnWcqFF7jerNChVPYbTSsD8VoLmA2hHdOm9
         +Odw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=LuGeSNbKurxNT6cTyeNpkYsJV43ciyElQjPpPtv+srs=;
        b=ylupZzx73bL4PZkhRmer/AVrKdOfE2036CpWD/HhDdAnCr6NS0g3UolnpyHb7FAW9N
         X42yTvFYFvI3G3HD6WKO82WH+/W+DV9Fnfa7sAlYevsHYeQvHSOC40sFwjHfAq2o63j6
         AcgWXf1T4crO2GB0wCXdrcKU9A8oZIRuvx46pzVrUyEHNnEsq0bbe1K/Ml46/UPati38
         fKig7Au4J4t5AmQuXyVeeWlblonMN47s4vZi3969o750in2SZ7ELg2iZcG4vc9btUCrm
         KSmdE8QyKl62pvXYqX6+Y8OZWlaMtLC/N95Y31iwlCNqjRS/in04cfmBixkwX51+cU/8
         G6OA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LuGeSNbKurxNT6cTyeNpkYsJV43ciyElQjPpPtv+srs=;
        b=Y131E0K1lUdwRB0JyRsJ6xCAd6cyvyn30dIiEnosddzaW+ib+1ZPeVtovMsvKSWWf1
         aLoG4POP4kW+9fiI91VczBKYB61pQ9/oM5c3PNOEzxtSOF7BFAv8TnifRM0W7vj4Bd56
         O0f4CvYRH28//d9wdWlVK23iFE3nZ6kV4LPtkiMLd6B8IX/CCrArRmnrLv4Ky+EenvM6
         SnaZ+fi7pukv6D4g99x93WEFKhgFaPzDtRExx8ckL7e4Ri1eC4aBmWbzHJqiSIfJX2Y+
         GCweT0ZuHBM9ljiseWevZ+NKmjfdRKRkml2eaJt3mwgXXfsBnwv+WaRdYJw0+q4hAX6F
         VU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LuGeSNbKurxNT6cTyeNpkYsJV43ciyElQjPpPtv+srs=;
        b=jvPqOdg4ItDmeO2F9cdNf4pwZL8Oj6OyFroPyOiX0VJrCW0060WtwFq9MrILWX5LEs
         M+CWIU9X8MlYQVm+c6Dzf6px3zLiFd+U+IIlVHML1FmYI4XlWAHsTqswdUUTq3+6n6B1
         2UTHaUfdOKPdn+KTtUy/2KbTJmBmhJRGyPjreouNe6/sHZcmiBk3TdXKPo2r2k++ugi2
         KUMeM1lmAI5FgyFzpbhu5SaQEcrxHEcLiAAfqCt4QXMQzpu1krSGn4+SXyRMrr/c6Bk3
         eDTnJ7LooNxT+CgcsUuzYvzOOy4n8th1OF7YTyCCK0D44Q8QgDXmSfKXr4vgcVvvDPp9
         bd7g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUzpxFy31ZJeFlPTf+m03sGGi8q3DBITpPgClR8yoKP9lHT/3Q/
	A+kppv8wKNbMzrv5Podsejo=
X-Google-Smtp-Source: APXvYqwKOUTzqJGsYxDGL574gEyR3n6q8mB9RjNzeP8kIIcjYQqvZLUK//qB8XPwN+dwcemF2F0UWQ==
X-Received: by 2002:adf:ec49:: with SMTP id w9mr14238944wrn.303.1560875383119;
        Tue, 18 Jun 2019 09:29:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:9083:: with SMTP id i3ls4903599wri.14.gmail; Tue, 18 Jun
 2019 09:29:42 -0700 (PDT)
X-Received: by 2002:a5d:488b:: with SMTP id g11mr5449464wrq.72.1560875382541;
        Tue, 18 Jun 2019 09:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560875382; cv=none;
        d=google.com; s=arc-20160816;
        b=UhbE0MvVzQDHv4gSmeJChGHC8AkRg3atRB2wOEYUnhU7izg9aMM8vduc4fuwglRMvI
         gLBdVmHyLIBE0iGcgySzSxWutQ4Ad9KE6Gx4eg2XZiep2FB54QDwjoqNAedCEtkkZqAj
         HCCu/dAEEqDwoR5Ctbfrn4FnrzcfvQ9FDYgvAaesCCBX5sVsV+Y0TPaCZmS2J0n+4ZqB
         naan2ntLjbgkqVqjsNPMyNWx9o23jmZCtDeKuuGgYrwH9LckaAP05uw88sUWZoz7wCgl
         UJpIpi3b8/rP+Y/Eb0b6eFS3XsS3XDAWwwEpQu21tFLyQBBVw0+ZzNjp06U+U+js3Lon
         Eeqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=cOPeawpcmFhu6e2/QiLCvFQygELJWj+AIQZok+VL9pk=;
        b=TOyi/Kg5AYD+YCRn8JcoD4rNz1IiVd3GZiBebhFWQZ0T73QlprjSd21Z5BV+E1d7fU
         o7+xBmOJb8qSdHK4CjBoVUc/Hz5kOzaGEsuS0XBMN8agLtSgqvJF1mcufP+I+VlsmjRx
         hc/6YLpjfKrxWTbF0+FNMXVsZEBAfdwIL1/82fqXjX1gmfltFkmxzZpBxB/X4NbtLJOj
         1oK0PjpQemE9VYB4FqdrEWQrOMHipTMkZQoZGezYPorKX7giJTVeNPJ+xycnS/tIVz+n
         mOiRqrvykHLI6T0ItGWNNwugxB2blmZL8iB3VshdD10Gv6t50UKM2Moo5GB/pCtT5VcN
         wYIA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id j18si601493wrc.1.2019.06.18.09.29.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 09:29:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x5IGTg3m027227
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Jun 2019 18:29:42 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5IGTgco018766;
	Tue, 18 Jun 2019 18:29:42 +0200
Subject: Re: [PATCH 2/2] pyjailhouse: x86: implement pio_bitmap generator
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190605161745.2389-1-andrej.utz@st.oth-regensburg.de>
 <20190605161745.2389-2-andrej.utz@st.oth-regensburg.de>
 <1facd54e-88f5-b3c0-91e9-85a2aa821245@siemens.com>
 <8d1f8f9c-8cdd-e4df-acd3-cecff65a2612@st.oth-regensburg.de>
 <54068680-fcce-6738-d5b5-775cebb24e6a@siemens.com>
 <0b53c6d6-1810-fe2f-f077-20fe8272ff36@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1a72db02-28a1-3072-60fb-5ea164b982ce@siemens.com>
Date: Tue, 18 Jun 2019 18:29:41 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <0b53c6d6-1810-fe2f-f077-20fe8272ff36@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 18.06.19 18:23, Andrej Utz wrote:
>=20
>=20
> On 18.06.19 18:04, Jan Kiszka wrote:
>> On 18.06.19 17:55, Andrej Utz wrote:
>>>
>>> Hi Jan,
>>>
>>> On 07.06.19 09:23, Jan Kiszka wrote:
>>>> On 05.06.19 18:17, Andrej Utz wrote:
>>>>> This replaces the old static port list with actual port regions from
>>>>> '/proc/ioports'. The static regions from said list are kept and overr=
ide
>>>>> the data in case of region overlap to retain compability.
>>>>> The generated port list is virtually identicall to the old one but ea=
ses
>>>>> manual configuration.
>>>>
>>>> IOW, the whole PCI IO space remains accessible, is now just partitione=
d in=20
>>>> order to ease manual disabling? I wonder if we could not go one step f=
urther=20
>>>> and only allow known regions.
>>>
>>> But isn't this the same as the static regions ...
>>>
>>>>>
>>>>> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
>>>>> ---
>>>>> =C2=A0 pyjailhouse/sysfs_parser.py=C2=A0=C2=A0 | 135 ++++++++++++++++=
++++++++++++++++++
>>>>> =C2=A0 tools/jailhouse-config-create |=C2=A0 14 +---
>>>>> =C2=A0 tools/root-cell-config.c.tmpl |=C2=A0 15 ++--
>>>>> =C2=A0 3 files changed, 142 insertions(+), 22 deletions(-)
>>>>>
>>>>> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.p=
y
>>>>> index 56265fb5..d06a476a 100644
>>>>> --- a/pyjailhouse/sysfs_parser.py
>>>>> +++ b/pyjailhouse/sysfs_parser.py
>>>>> @@ -142,6 +142,57 @@ def parse_iomem(pcidevices):
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret, dmar_regions
>>>>> +def parse_ioports():
>>>>> +=C2=A0=C2=A0=C2=A0 regions =3D IOMapTree.parse_ioports_tree(
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IOMapTree.parse_iomap_fil=
e('/proc/ioports', PortRegion))
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 tmp =3D [
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # static regions
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PortRegion(0x0, 0x3f, '')=
,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PortRegion(0x40, 0x43, 'P=
IT', allowed=3DTrue),
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PortRegion(0x60, 0x61, 'N=
MI', allowed=3DTrue), # NMI status/control
>>>
>>> ... do here? Or how do you define "known regions"?
>>
>> There are a number of known platform regions in the lower IO range, like=
 the=20
>> above. And then there are the IO regions of PCI devices, according to th=
eir=20
>> BAR settings. Currently, we permit access to the whole PCI range to the =
root=20
>> cell.
>=20
> Does that also mean we need to read the PCI config space to whitelist por=
t regions?
> If so, I'd like it to be another commit on top of this patch.

Yes, this is likely a topic for follow-up patches: We either need to parse=
=20
/proc/ioports more sophistically than what we do in parse_ioports so far, o=
r we=20
actually need to read the config space and interpret the BAR content.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1a72db02-28a1-3072-60fb-5ea164b982ce%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
