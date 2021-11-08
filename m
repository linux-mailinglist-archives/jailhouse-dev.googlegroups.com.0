Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4GLUOGAMGQEJSSMJMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 8856C447C54
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Nov 2021 09:55:13 +0100 (CET)
Received: by mail-ed1-x53a.google.com with SMTP id g3-20020a056402424300b003e2981e1edbsf14354474edb.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Nov 2021 00:55:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1636361713; cv=pass;
        d=google.com; s=arc-20160816;
        b=ioeWoh0xk7JTw1u2rsxpUCkyiM2thpWK+26jlvqObfA4X9Ym4cTKXiFcAAIX89BdUU
         OAh7a8OTC0HC52wLYHdHQbPomwXlRPb1jjTep8hktqSgYipWb+ekH6oIvQZk2Dj1etnm
         YP8vIhLSsiAcyVYLg8ioPqa2Dqg3/G8bzQmYZyN4sGDdPk5eSbV+KXgIS2PM2mti5oZd
         /gQXz6iUIn83uWyIa15t5o0pEeeaJ4nwEyojbtNtaev5FcGwH8RCxoeYQ4MtsppAU6Y9
         uT4pdCpd2+TjK0gkX31IUDJMItaiJioShXwoT/QNnJb4QmwSi7IfldTtulfMeyQBNWEF
         HsBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=uZA796ZqLXLOSPTcqEEE2C4gYHnw7rxqxUOc/D/3I5A=;
        b=XrOmPd1/OeUwCm8p1krZQ/00ly8V/MImWZ1njACpuF/qmk3DsIDscXEfnAPbbapCVl
         cGO5+A30BXrl0fU4/eZBR6t8euXeJ9JibSKwGqCeR99459Y96fj5RYpn/Snjxxoov6Ms
         cY6TZjV3YZhLuw3Knb9b+brMZWXHEwz1AF3u3P8hucD99N/Pvenb4YiXpJ8GsLzjk//T
         PUYF4bxn+ZuQvu205tL6vmrj80PpZbr9hfqyyUVfvjnuBK+eS3E4y4jwaQntO4gtFpur
         +A3QsBrwB7v6Qdk0ly3fsBzn648ZxzILpCwsBzUgNTvkqTceH5aNrJNLfG95X9l7WKm7
         Q9EQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uZA796ZqLXLOSPTcqEEE2C4gYHnw7rxqxUOc/D/3I5A=;
        b=ZcmfRpMNE/+nUbDnoBEnVVqh4/nshpjtSuAfXsfD3Dt6HEEls+xvD1Q30ENy73fYO1
         wOn/rbLF/FzU6HmpXaHpbqvQnCT7cZH+JTWzmWQIfoCOIBAjpENNbsWzTR/+vJzJhkDj
         TgDH7H8eqXBEQ1R4Huf36XbR5wsQMlTBf9cf2IkRIQrKm32NbJcqlbj3VAUnF5uDkBUg
         9ZiQTFYH3HvVKDcNQEae80gLvsXzWE5FWqTvm31Pjr7oIfmu5LKOnh6bu8obLVq4UAXM
         9DZ0D1e5NIHcHWBlBaj3QXIj+k8vuXPzb7L1flyaRIfR4e+yG/RLrS4kJpz/YcHArW+G
         SjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uZA796ZqLXLOSPTcqEEE2C4gYHnw7rxqxUOc/D/3I5A=;
        b=Rxe/zCXEoPriaH5qdK29lTb0fFzyyeQNVyHpFhNLGFezUmJi027QGVXEkjFUNxSpdi
         x30QCyyFgBE7V8vTfdVe/8mhPmPamex9t+xrPGgwzz1ly8+xLQ9ZkqQs6eJ1OHXJp3TX
         fNPAdtnXmc8bG5/PzhyoR8OrLZ1EaDg6I5drbNHb3qH6KKbyXUP2BLD1iokM2lIbpTrW
         LFEXqgDVycXPODaQXfpsggffsYJ4Zubt9jhDwrIIjxNo2JXYmFQ28sVEm2Xz/PUToX3Z
         66q6rC3kLe76apYZ0sVYlcOI+7WLbIaxmYpnKX3H5DWgkCCy7+WLeWG9zuzfGEYi0Xjr
         rLQw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530LZgyjARi3bmjvgk5TMBkbDd30MPf5kQAE2W42bi5TiwoO885C
	zjVstQkRLmkvVC3bm/+KEmc=
X-Google-Smtp-Source: ABdhPJwioElcz7YG7xtlUXLxq4O+8AiDM5CnFAw9KoFQDqHLz2ei7gW1tiOzW5iCteIadvQiIBi4aQ==
X-Received: by 2002:a17:906:b090:: with SMTP id x16mr13727646ejy.438.1636361713255;
        Mon, 08 Nov 2021 00:55:13 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:c143:: with SMTP id dp3ls6930617ejc.0.gmail; Mon, 08
 Nov 2021 00:55:12 -0800 (PST)
X-Received: by 2002:a17:906:c155:: with SMTP id dp21mr3376895ejc.236.1636361712180;
        Mon, 08 Nov 2021 00:55:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636361712; cv=none;
        d=google.com; s=arc-20160816;
        b=keR6pKP3tgZSwKqKEIXbw2O17TJhXSbNQk8aBKfR3Wc+E+hVQqtIHkhAsiJtqxn5AP
         r9rll9sML+IGANlqXcs3F3Wrk8AAT2GTrvCTU7TMnaSrqUVwADFPDC9/y67nxmDP9YGL
         qqRLmMFOJWc1P8dvwUep4c1QlDGnL7euDwnXKftAr+MY4ABm4Dx6pQ2LNnN+RbCG4csS
         GbYWWSTkxKz7qWy20jS1iD6k5SZe+fcXAUMs+PkG+2Xehk+D7xUuVqUN2EZPXqdDKVuy
         WSbpuGYEvaqV6Qy2fdb+0ttU7cnn7LRPeevzOqvC+1DA4aTPPxNvvOTYDyWcqpjR0S9t
         gbbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=WkWd8r/Zkic7O87h8x4ILE1R5y4ak930hxYT/rAc2b8=;
        b=exGL3oe088t5A3PcVZrIlRXROfSMYdLE7xttWgrtyQ8cERH4CkJu1sppz4Iw5BahYt
         fsjdpD0YymmrHz7oNiJzT9o4vocc5PuCvX9EFSct9J6Wm0c38bUY16C6Ha3uNhsgvtDJ
         lEhxvbPeQS9TBHD3Gc5x6NL7gfgLwmB0lPZcxAa8MxUWJusiHo3HbQUdgqUVeljA85V2
         hd85urFH1FjaeSeHyOJ6hOQtS0ga0vklGtOFgE3c2Je7DuJ8qaOe9GnQVat87GWENvyL
         8Krwhv/FK37rYa5yg3wVL9QI11e/Z1x8D+vvyEuOBiaJBVPZy75hjY/DJ90VOvs8/Bvx
         CcYQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id d2si1034725edk.1.2021.11.08.00.55.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Nov 2021 00:55:12 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 1A88tBvq015522
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Nov 2021 09:55:11 +0100
Received: from [167.87.33.94] ([167.87.33.94])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1A88tBLJ027930;
	Mon, 8 Nov 2021 09:55:11 +0100
Subject: Re: Problem: system hangs
To: Raimundo Sagarzazu <rsagarzazu@ulmapackaging.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <462c8035821c4482990bdec49113221a@spc015.packaging.ulma.es>
 <d60a1523-b304-2c16-efee-0c4f0638ba77@siemens.com>
 <fc8922fafafd475281b11bc752059476@spc015.packaging.ulma.es>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <991f43c4-87dd-05ee-d3f7-3b408c979fa6@siemens.com>
Date: Mon, 8 Nov 2021 09:55:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <fc8922fafafd475281b11bc752059476@spc015.packaging.ulma.es>
Content-Type: text/plain; charset="UTF-8"
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

On 08.11.21 09:14, Raimundo Sagarzazu wrote:
>=20
>> On 04.11.21 12:47, Raimundo Sagarzazu wrote:
>>>  Hello all,
>>> =20
>>>  I=E2=80=99m experiencing a =E2=80=9Csystem hanging=E2=80=9D problem wh=
en jalhouse is enabled. It
>>>  happens with just rootcell enabled, no need to start inmate cells. I=
=E2=80=99ve
>>>  been working on it for several weeks trying to have at least an error
>>>  log or report but I didn=E2=80=99t success. System just freezes.
>>> =20
>>
>> Do you have set up Jailhouse to report to the serial port? Are there any
>> words from it when the system freezes?
>=20
>> Jan
>=20
> Hi Jan,
>=20
> I do set up the serial port but no words on freeze. This is the log at bo=
ot time:
>=20
> Initializing Jailhouse hypervisor v0.12 (273-g6d9c51d0-dirty) on CPU 3
> Code location: 0xfffffffff0000050
> Using xAPIC
> Page pool usage after early setup: mem 49/975, remap 1/131072
> Initializing processors:
>  CPU 3... (APIC ID 6) OK
>  CPU 0... (APIC ID 0) OK
>  CPU 1... (APIC ID 2) OK
>  CPU 2... (APIC ID 4) OK
> Initializing unit: VT-d
> DMAR unit @0xfed64000/0x1000
> DMAR unit @0xfed65000/0x1000
> Reserving 120 interrupt(s) for device fa:1f.0 at index 0
> Initializing unit: IOAPIC
> Initializing unit: Cache Allocation Technology
> Initializing unit: PCI
> Adding PCI device 00:00.0 to cell "RootCell"
> Adding PCI device 00:02.0 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:02.0 at index 120
> Adding PCI device 00:0e.0 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:0e.0 at index 121
> Adding PCI device 00:0f.0 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:0f.0 at index 122
> Adding PCI device 00:12.0 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:12.0 at index 123
> Adding PCI device 00:13.0 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:13.0 at index 124
> Adding PCI device 00:13.1 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:13.1 at index 125
> Adding PCI device 00:13.2 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:13.2 at index 126
> Adding PCI device 00:13.3 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:13.3 at index 127
> Adding PCI device 00:14.0 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:14.0 at index 128
> Adding PCI device 00:14.1 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:14.1 at index 129
> Adding PCI device 00:15.0 to cell "RootCell"
> Reserving 8 interrupt(s) for device 00:15.0 at index 130
> Adding PCI device 00:16.0 to cell "RootCell"
> Adding PCI device 00:1f.0 to cell "RootCell"
> Adding PCI device 00:1f.1 to cell "RootCell"
> Adding PCI device 01:00.0 to cell "RootCell"
> Adding PCI device 03:00.0 to cell "RootCell"
> Reserving 5 interrupt(s) for device 03:00.0 at index 138
> Adding PCI device 05:00.0 to cell "RootCell"
> Reserving 5 interrupt(s) for device 05:00.0 at index 143
> Page pool usage after late setup: mem 360/975, remap 65548/131072
> Activating hypervisor
>=20
> After this, nothing.
>=20
> I'm working with three very similar boards based on the Intel Atom E3950 =
processor: iBASE AGS102 box, COM Express module + custom carrier and a pane=
l PC from BECKHOFF. Two of them fail, the third doesn't.  Where should I fo=
cus? BIOS? Memory region differences? PCI?
>=20

Hard freezes are indeed hard-to-debug issues. If you have working
setups, the first step would be analyzing the delta: actually the same
hardware / revision? Different BIOS versions? Anything else different?

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/991f43c4-87dd-05ee-d3f7-3b408c979fa6%40siemens.com.
