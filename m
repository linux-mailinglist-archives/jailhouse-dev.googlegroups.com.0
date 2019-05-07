Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLV2YTTAKGQE4CPS5SY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id C578615B3C
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 07:52:46 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id k25sf161109ljk.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 May 2019 22:52:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557208366; cv=pass;
        d=google.com; s=arc-20160816;
        b=klU57HSxvupmvk4lVBryzttRca1GSqiBcCX4K1a6p3V04xIs6iBr4Ijo1DrCGZrrmP
         xJS5rmpDPObMCeriFVgdpE2WeXGsRZlm0mFduwOKJXxL0STZol6Sf2zYFHRep4MbPHPd
         lfzRtb5XHB5NBNK/MyQChgiuoiQQ2mm6YTubtI+QAAFU70KI220d170G5CaVYqZwIzyW
         RKVHX4mBbL3yUSVW4uNDFI4NryNvuqlVXTjGVZRObt8kv1OEKi9nWHGX+jXKi9C8NXWJ
         sxtV+P7dZi+Qo8tGwamAdc+nauOW2YNbzvYl0gwZUT/9Kxv6BLQQHa4f+CMXVA3YthUs
         hE9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:sender:dkim-signature;
        bh=aqhqnIVfqHVtVx6QN7l+hB6XYgKmzBZw6isR9UCTs+M=;
        b=gavqiRFfln9OacNOKjIWqEupDrcivO3JnbC926lyMAjllBae/ABqDtTRo/LlwUxrOE
         dS63KtETeajjyO4AwIxoAhRvfUv5hKx+Ee9rhAIYoQM5Aqzh2Ecs9qGjUzLREwf24yFT
         0PVn7oTXnuLairlkGej8RnJyYFZVA8WyHPWWkVfG9HJEr+pHJjFqQ7opuxIJ1vOUeRXW
         Alns1ltHHobTKWHnHTUkihfQgrPgurfu63uvA2kBLoAUBHZ9safoZ3OIJlVKfFraXGlB
         1YTsreW6almD+cm/zPFU7Dmqp/zOEOc12zRF5GtrvVXiRVICsfn9Wx6Fs6KKTDUBjYyY
         Fyvw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aqhqnIVfqHVtVx6QN7l+hB6XYgKmzBZw6isR9UCTs+M=;
        b=dXvSDUeQI7K6K4uRAkfYlGUEh/ZCuQq7M4v046T8iyTzuJptehQH6SyPB4sayEpTiW
         On+E4txJS6oVNH1UCdkMo/0g2XeP9qUmpr7DHtBGYlQ++T7PoCNSQ6Gj/s4ezOcXipbo
         NrJ05efqa4sHd9MX7iP9bJvl80Vfo1KdqaJwbAS01sO35GHHIYrDUp77z5QodrrgcHaY
         8Dh8pyfYt2WmrRBSaIOcD6V66aBxqHDkniF8b2HhDajYxxrwWkBKKD/3W4vMVLFl2Xll
         HsgemYcw5KaTlrC3Jw8EQSwKRayXSyGcQj7KLg+beaTWRsGqSsNhfBIrLEwvK1UNPgaN
         fwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aqhqnIVfqHVtVx6QN7l+hB6XYgKmzBZw6isR9UCTs+M=;
        b=WjpSR1Q1uGKjLVVKi+Ni3VTllmSIl2j0Sc4iinlXVXlkS/9UV9KVyyiZ+N1yncK6DS
         3fx6SWsi0PGj9dqt0TdjPwMuOry0a3DqwGzDv5NDgBgHluZWwF57ZiPrweGViTcEqXAz
         59UWJgohLU698zWhsRrXc4GRH9l2m78GmIQidUEaFCLn3ZXsVVshXv6T38MPS6PnMBj0
         SGdWkns/O7tcbB6UVQQFbWzQh8p4/7t/spQ+RgXqpbyz5N90wpnUaYTbs7zKPRpw9nRD
         O2PJBS1qkAGcNzaSfJNcTc6oilN8WV8IL8tSWL9SO3xDOgqcsXrAh9k3GvTFIDk+C3K8
         2KYQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXoXfVdELIs3epDXbr2SECTadxepR8xBC0iqva1XACjuXX1n7Ul
	5ytJ6HcrQc8ACoIe0LyNQ2Q=
X-Google-Smtp-Source: APXvYqw/aOwIJeEy7o4bxbL9JGx2SbwZZO6wFCT1EnPMKXmJmcIxiHpDSIIsYashSGzG+Fmu8uUZOw==
X-Received: by 2002:a2e:84ca:: with SMTP id q10mr2525254ljh.117.1557208366190;
        Mon, 06 May 2019 22:52:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:44cc:: with SMTP id d12ls1276248lfm.4.gmail; Mon, 06 May
 2019 22:52:45 -0700 (PDT)
X-Received: by 2002:ac2:538a:: with SMTP id g10mr16128275lfh.141.1557208365499;
        Mon, 06 May 2019 22:52:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557208365; cv=none;
        d=google.com; s=arc-20160816;
        b=mZBTL0yRyhTaPtCyOvL545Qnsh6pIru6/ET7MuZZX+IITpWm73dn1gsBJ7Hz5wOE/R
         5YiGCVkQlvI26AxWe5R/znHgOVPcQVVZvfk4TyjcSFvgAp9u4ija0qQ+CTLW7U3JTIJz
         dAP8lX+OOO14Wllz+Bgylm7mifie64OVKLmP18Ck0CkfVqSTb85vZueQoAzF11aULsCt
         BZ/VISlpuWGIy3uYcrNHxhIpjYHt2OA+W1eEQt7oS02KFYcEdyF2Rh8GjcaF5GQalpUY
         NH8sMUWpmBCTpf8ABfkOM6VvZC5EZOttaVac0dbv8V7Mzbd1x61z5lQdsJrvn4ZVmJ4m
         y/Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject;
        bh=9Mly1oPxz1pBoKbewQatibBN9bOOuqOjN1nCP3h8+qE=;
        b=PirJQ8HR2weVso3grHuJi5oFgJjRrW/lGo9QSwaqPOIwsgVXpck7F0KRCChSQlPVDX
         VAZF+UsSv69ksZMYH7CkBacYawBYg+kC012DixaidJspDs7nrpnAtOfUGj43LP0+AUV1
         8eI09FPAffBDv/JyLE5DgQu1YXzd1VVomdWQ+e6xx4xguzEzBCuM7anq0QrO+rLn9Ud1
         3c7t2Xx1TjiN2t5yFNDrsta2eMvjulErB6OwqdGwMponcen/coqmV3HAs6cyk1CpRwyR
         /SCQUrDlKT/ZYuAQf/Gwet3h5KD69PVNUfBldYIt2rVL1qksQg6mjdY6nKcCBH8Ks42U
         dGfg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id m25si572530lfl.1.2019.05.06.22.52.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 22:52:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x475qiBs025063
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 May 2019 07:52:44 +0200
Received: from [139.22.37.57] ([139.22.37.57])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x475qhtR022983;
	Tue, 7 May 2019 07:52:43 +0200
Subject: Re: Unsupported DMAR Device Scope Structure
To: =?UTF-8?Q?Hakk=c4=b1_Kurumahmut?= <hkurumahmut84@hotmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <edd9ef72-beae-42c3-94c7-ac5bf29ba57d@googlegroups.com>
 <594f54f4-eb5c-5b64-2d49-38997bcf2f8b@siemens.com>
 <50b964d8-41e5-49af-96dc-3080cbd3966e@googlegroups.com>
 <62d847c0-b4b6-4395-b603-ecf2f87095d7@googlegroups.com>
Cc: jeanne.romefort@gmail.com
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <3bcebf94-23a5-18d3-1f0b-bb25717167a3@siemens.com>
Date: Tue, 7 May 2019 07:52:43 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <62d847c0-b4b6-4395-b603-ecf2f87095d7@googlegroups.com>
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

On 06.05.19 20:38, Hakk=C4=B1 Kurumahmut wrote:
> 6 May=C4=B1s 2019 Pazartesi 18:19:07 UTC+3 tarihinde jeanne....@gmail.com=
 yazd=C4=B1:
>> For sure ! You can find the requested file attached.
>>
>> best regards,
>>
>>
>> Le lundi 6 mai 2019 16:11:05 UTC+2, Jan Kiszka a =C3=A9crit=C2=A0:
>>> On 06.05.19 15:47, jeanne.romefort@gmail.com wrote:
>>>> Hello,
>>>>
>>>> I'm trying to run jailhouse on a HP ProLiant ML350 Gen10.
>>>> ACPI DMAR is available, but my hardware-check fails with this
>>>>
>>>> error :
>>>> 	"Unsupported DMAR Device Scope Structure"
>>>>
>>>> I also tried on a HP ProLiant DL360p Gen8 but I ended up with the same=
 error...
>>>>
>>>>
>>>> Any idea of this trouble ?
>>>>
>>>
>>> Can you share an archive generated by "jailhouse config collect"? Then =
we can
>>> analyze locally.
>>>
>>> Jan
>>>
>>> --=20
>>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>>> Corporate Competence Center Embedded Linux
>=20
> DMAR region parser is detected Device Scope size more than 8 byte.
>=20
>=20
> VT-d Spec at 8.3.1
>=20
> If the =E2=80=98Path=E2=80=99 field length is more than 2 bytes (N > 1), =
the Device Scope
> Entry identifies a device behind one or more system software visible PCI-
> PCI bridges. Bus rebalancing actions by system software modifying bus
> assignments of the device=E2=80=99s parent bridge impacts the bus number =
portion
> of device=E2=80=99s requester-id.
>=20
> This devices
>=20
> 1C.7.0.0
> 1C.7.0.2
>=20
>=20
> Current Script does not support this type device... Scripts must be read =
Dev Scope length and than it is read the DMAR file to collect correct data.
>=20
>=20
> Jan can provide technical information on this issue. I have no idea why i=
t's not supported.
>=20

I think I was "just" too lazy to implement the needed logic behind that.

The tricky thing here is surely the identification of the final bus number =
the=20
BIOS or Linux as chosen for the device described that way. It will be neede=
d in=20
order to identify the device entry in our configuration. Likely, we have to=
 walk=20
the topology, first identify the bridge and then query that one for its bus=
=20
number in order to describe the device.

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
jailhouse-dev/3bcebf94-23a5-18d3-1f0b-bb25717167a3%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
