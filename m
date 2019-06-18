Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCUXUTUAKGQEZUH5XOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 766BA4A624
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Jun 2019 18:04:26 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id r4sf29854wrt.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Jun 2019 09:04:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560873866; cv=pass;
        d=google.com; s=arc-20160816;
        b=s7BC80jOB18uBD7/HrKWzDrZp4rin4/ZEjaPb42Uf7X/Ys3usg+NO/g/rWyBV2zdjS
         BI2foSwxHizQR68YecPGsGUVVVUTFYe5FqYYrjH4HtIhQpum7FWD32amCWIRG11KWOOP
         Klhd/Lrn4+Lgf666nSRQHEViPu1pofsUtUjoGeQcFKGmVsPpy0Zi0b8gnS/vxB4MLH0+
         TUTc5e5HRr/UN70mUv1LZ7zELXvFxy21Ie6+rk6lhguhhPpOZMgAE/SDXwNLPDS4Y8sh
         7EmzLrO0+6UrnjIjePXzduJNIsWwEcNoJJqw/qajiNrKz2Vqo20TRNDedCHQttLac7G1
         b7Vg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=FBhOB9FoddMQcO8rdmr68vkdLuNVhzmZPHoCNkHp/BE=;
        b=FhTAWvS9Lznejvpqrc3cVRg+Q0ru9ApAQ2RpdNrfQzPZmlegY/b5obeuHqZ/TMFF4+
         tABEVfUWfP1tMsTIdV+ioUCnHjtPqwg3463pb1zfXC6bUo446DoyB7jy4jV3EpaqUQQ7
         w4G1FhnjpnplN3iAAfYbH6Aecp9pZrFkY5tnSrjVsih4ZkPlynaKiltNGHoWVj3R5Kne
         mtmQQfKFKykKvYAWcUHjj3TKvPVEia98RlXYZY6aiZ5Rf6CUG0wpnPk+6veG0gtL97m/
         d41eMjuNeGU/zilOe8hmG8MKBCIwnrRJy9Ajxt/m9JVIcwNbLIdKzaq38CYB371W6qox
         /3eQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FBhOB9FoddMQcO8rdmr68vkdLuNVhzmZPHoCNkHp/BE=;
        b=jUJ0+PvDZboxGaO8larBFynxOuqybm3gH4PV1GMXwN+fe4Ad1s/oVKgFkFraDeknA+
         kdKrXZNMBa+C3GN4AoHX/MJu/OvSWl0XfBXvPk9u3oaju8bDL6itmzU4h3mb2DfZpKs2
         muMd5fifKMIF8S73cdBhn8GDmm6yDB2QWO3G/ethUSDGb5ye9ML8M6MPjwu6pd+C+X7W
         Qeg7gOiJh6XdPQw5dTIYFP0IwW5dLe7VKj2oOrisVbtqg5uPv7SK2x6DdP4HRdEnx35v
         STYzz5tVS3JJKE/Nol21BJ+zLV2E4FoBtaIonEI3aUZzUxztOFN13XaGd+StxuNd+YoG
         8bAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FBhOB9FoddMQcO8rdmr68vkdLuNVhzmZPHoCNkHp/BE=;
        b=FQcw7EuTYqTGW+ioOCoLbSGRFNxre2xQIrhFIqf1uG/DyFgXblK8Spxb/kmd775wmy
         cr1XKmaMvRjDBCavRNvzehrUKadt063JeT9ey9MzwrxOgyC2Wd1vrHGEBxiVLvNDN97+
         qesBnJ/ayZ50UCA5Zbox7IH/6tDuyAMuykqlgoozhDXT6qjXq8u5UEc+lF9eXBYoHi+w
         rYwcP0o04chhxCfFRrK/pyxOCprrpQhh9XnrJlGirpIS9oYb+bf3Dyl/EL+JFAPbJFQa
         WrOCx0DhPd8ObwMCBao/aXuQm6qug5O28NnmIuf2j0M5iSCueTLIh6Dmtg+ZFNBQQTXb
         N2kw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW82rKILQ/Z4PfQArFvEgsNC4X7oiXkS6wexGZva5K+gzEE47tQ
	NLshh+PDKNdjkiWx1eExMWo=
X-Google-Smtp-Source: APXvYqyBNYApQSIv+afVfv7doDAxWqo0ZXsVdW4FZADuIMM9U97mVAEsQcTsZaL+iwnpFYGR1dFlag==
X-Received: by 2002:a7b:cb84:: with SMTP id m4mr4585411wmi.50.1560873866194;
        Tue, 18 Jun 2019 09:04:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:5f86:: with SMTP id t128ls1153150wmb.3.canary-gmail;
 Tue, 18 Jun 2019 09:04:25 -0700 (PDT)
X-Received: by 2002:a1c:f415:: with SMTP id z21mr4598811wma.34.1560873865493;
        Tue, 18 Jun 2019 09:04:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560873865; cv=none;
        d=google.com; s=arc-20160816;
        b=pYNDih7U6KSc8CLBpxxFo9bGPTq0BUa7K5gqU5YLr/9ItdfMzR5AA4gsWMf0Jjc5fs
         qeo2Dax/XXSbFpls6sc0zedoe5GxnEGJZKXEIQv/YvlceZtpEkmTWHvscIvzM59VatjV
         bfm0DuyZPHGPjc/BxT9McH9CxajHf6YtiNx3tMHpJACWsvhsL3fysfy2gwsp7yUp+tYF
         26gRTQ7MGffGHA2F7RWp1LH/BDaDg55CQOwVplyUjRFRh0lxDPjYD/KT0/UMjBoCicxo
         FEo7GZIttcc6aFM4MfSXOs39q04QlLnhkyNuv9Il/8RaNIHEkZJHbLDrcJvcmkz5ivJS
         QGdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=48olDGvMu6oZihnwdaX1sjQavPiVlhlBc46p/9MK50Y=;
        b=TELRbDN1JS1gsuEXJgv1BaB0UJ76EkF3rEzJ1XzRK6ZsSJ7y2QmSQ4AjOc0PUv/86G
         7amxdV9wVa7TcFXFyRHSnt7kW9fwRYA6ShAUi7C2qW6hkneZ0twZk/5mSR8nx0xUZAB7
         +68cdDAZOpHXKq7eMfQ1/U0zeeVkYv0kBg6WxarFbaH8sf3YLPTDHDRCPHr9N/eopkAw
         zutcci9JEoT5bRfVa09VtoGsKPGTCtY3SID6k3YX7gzJG+BUZHT8euKM6oaVmevhYeln
         J+LBmIg3OZENMUbpGe434Ybmm47UZLvkLZuE459n4/Qk1u+iih+5QvbchWoKIYuRek3l
         sEYA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id n10si166232wmh.0.2019.06.18.09.04.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 09:04:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x5IG4PmJ021331
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Jun 2019 18:04:25 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5IG4Ogn004379;
	Tue, 18 Jun 2019 18:04:25 +0200
Subject: Re: [PATCH 2/2] pyjailhouse: x86: implement pio_bitmap generator
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190605161745.2389-1-andrej.utz@st.oth-regensburg.de>
 <20190605161745.2389-2-andrej.utz@st.oth-regensburg.de>
 <1facd54e-88f5-b3c0-91e9-85a2aa821245@siemens.com>
 <8d1f8f9c-8cdd-e4df-acd3-cecff65a2612@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <54068680-fcce-6738-d5b5-775cebb24e6a@siemens.com>
Date: Tue, 18 Jun 2019 18:04:24 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <8d1f8f9c-8cdd-e4df-acd3-cecff65a2612@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 18.06.19 17:55, Andrej Utz wrote:
>=20
> Hi Jan,
>=20
> On 07.06.19 09:23, Jan Kiszka wrote:
>> On 05.06.19 18:17, Andrej Utz wrote:
>>> This replaces the old static port list with actual port regions from
>>> '/proc/ioports'. The static regions from said list are kept and overrid=
e
>>> the data in case of region overlap to retain compability.
>>> The generated port list is virtually identicall to the old one but ease=
s
>>> manual configuration.
>>
>> IOW, the whole PCI IO space remains accessible, is now just partitioned =
in=20
>> order to ease manual disabling? I wonder if we could not go one step fur=
ther=20
>> and only allow known regions.
>=20
> But isn't this the same as the static regions ...
>=20
>>>
>>> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
>>> ---
>>> =C2=A0 pyjailhouse/sysfs_parser.py=C2=A0=C2=A0 | 135 ++++++++++++++++++=
++++++++++++++++
>>> =C2=A0 tools/jailhouse-config-create |=C2=A0 14 +---
>>> =C2=A0 tools/root-cell-config.c.tmpl |=C2=A0 15 ++--
>>> =C2=A0 3 files changed, 142 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
>>> index 56265fb5..d06a476a 100644
>>> --- a/pyjailhouse/sysfs_parser.py
>>> +++ b/pyjailhouse/sysfs_parser.py
>>> @@ -142,6 +142,57 @@ def parse_iomem(pcidevices):
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret, dmar_regions
>>> +def parse_ioports():
>>> +=C2=A0=C2=A0=C2=A0 regions =3D IOMapTree.parse_ioports_tree(
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IOMapTree.parse_iomap_file(=
'/proc/ioports', PortRegion))
>>> +
>>> +=C2=A0=C2=A0=C2=A0 tmp =3D [
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # static regions
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PortRegion(0x0, 0x3f, ''),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PortRegion(0x40, 0x43, 'PIT=
', allowed=3DTrue),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PortRegion(0x60, 0x61, 'NMI=
', allowed=3DTrue), # NMI status/control
>=20
> ... do here? Or how do you define "known regions"?

There are a number of known platform regions in the lower IO range, like th=
e=20
above. And then there are the IO regions of PCI devices, according to their=
 BAR=20
settings. Currently, we permit access to the whole PCI range to the root ce=
ll.

Jan

>=20
>> We should preserve the property "hack" for this one, and that ideally as=
=20
>> comment in the generated config. Could you enhance this in that directio=
n?=20
>> Benefit: you could add the originating device as comment to other port r=
anges.
>=20
> Ack.
>=20
> Andrej


--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/54068680-fcce-6738-d5b5-775cebb24e6a%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
