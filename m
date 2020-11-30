Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPHESP7AKGQE6EYBGGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x637.google.com (mail-ej1-x637.google.com [IPv6:2a00:1450:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7D02C84FF
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Nov 2020 14:23:09 +0100 (CET)
Received: by mail-ej1-x637.google.com with SMTP id y10sf5778535ejg.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Nov 2020 05:23:09 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606742589; cv=pass;
        d=google.com; s=arc-20160816;
        b=odzYG2Wt8jIWC49yZX1QbQvi2W6G0AkxfvN11tPaylGaSmtG8lOMypFqiflJ2X3iDq
         HC58VR5cofZSonjYcJSMHz/uhFSg3RBrvVB+EX0lGcc86Q7vcHBPjr2GqYSe8nEtK2UQ
         X2pFWJBP79lg/EhOPg3XLDEEsc6xgiz0Z2DEvFbiIPIZ8csEEl0lhxMeLOwF+WG7jl+e
         1Zf5PsFIZh6Tecp/hAhuYytPyKxPfgz2Ms6YKxN+WrbjTp+rMQT7H+Vj2ayf60Oudn9U
         /Qxqx9/vuFeWAQ+AnqI30EQYL8gVUDoo60019iody+GxtZTQhtku+CHTqXGol5xZyA9C
         hIYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=bg0TuHBroRg6IOqMUjGHsxd+J+DaOyC2PjVQqBRej9I=;
        b=sVkP0J3/yp/QJM1DYxNUuDSREC4E7IrET9QCln/QF5CdT19eyqReRWr2GKT/4WGY+m
         0afgxKZ09RYq85daYAC1gefGkwWzQzil53E8m2fqSRAbixtx88jrdjN2w/wejW8hc75I
         2mHifpwFd3bkW54JLZCVEnJQnTiFLnTxs6Y+buKALQ6W209ROYd//wChY4kUGjJDeyb9
         2e+0D/c7C84qcvlPx2f6GgrgKsjdhp0xe6cfMp/dAbMOM43VKVdlPo+RUdfVLMOW6QqU
         5CoArMFQY9V7PBKkT/rys9RlwoSC1H9wFyHFJAPXjwgTaJ0Eyg9ZNkNw3XuYCebTSkJx
         BKUw==
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
        bh=bg0TuHBroRg6IOqMUjGHsxd+J+DaOyC2PjVQqBRej9I=;
        b=qGcGt9v1OA8cq8VGXidgdJRbcEyROCNeIyoENtAphYoIUeFAwgs8k+O7V+YEXb98Mr
         1vy6uTipfuF7kFL3uisMjh0tPP+e72CxTq9gvgUThwRoaY5/lTF2jaWquRL9a12N3EOT
         oOswN15S4A7qf/1x1wa3aFULJUZ2CZq1egcdqsVF6jldd3wBRKmRK3U+UQEdlW9dvf6W
         X2jwWdYlrpfFa19v/J+uN0Qe7cqrq30fFtiKLrNfO56yy/3ck5OkUlmBESHd3veCJD1w
         lf5fuOoVtAgNCgTcKm05ABHepDWUUCW7GQgq8cTiQmVU50P4Ii9HKqES+6sAoPib/fP2
         qE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bg0TuHBroRg6IOqMUjGHsxd+J+DaOyC2PjVQqBRej9I=;
        b=pwrMrW5Pc/B2krlldVo8QKsPPbYxXfQpwNpigJ+nbrNnCZ/IUGHNRWH9TwhRAm5OyU
         CzFpWvkX0unDd7xY4etacrDc57AanwGPryubBWBNlAVlVwNQlRy03pB+b5OT9o/kOn+r
         w70wE+pglXXHNiAD04+3fx84MnkALgYq6CPh3y8DkfceypTn6As3NlrL6OvV4zmvSYg7
         gaq9RAamZtpBz5nz3NT62VermRfRA7ozF0Pa365E6jX+N/GqG4ftMsTwIdXClElN1Lqa
         /+AXpRpviXuNjLODqSnZvOWrDnrv3OorvBTO/J3BXzoQr2d9CIld+p2AjnhyI99dSSa1
         QscA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533QnGtdeduqTQT34cCU4ZgUx9ePCl/70d74Ni7whDYuTH4BVzRb
	cAN6FZ5vqsoHtxcneg/hcWA=
X-Google-Smtp-Source: ABdhPJyG6f3tNzT0SIIfH1ecnAxpafSawVdfSbCpiiGfZTO8pt6OLcY+WPt1UkGnlbCqrSesYNcmLg==
X-Received: by 2002:a17:906:6713:: with SMTP id a19mr21839606ejp.468.1606742589009;
        Mon, 30 Nov 2020 05:23:09 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:fd15:: with SMTP id i21ls2768939eds.1.gmail; Mon, 30 Nov
 2020 05:23:07 -0800 (PST)
X-Received: by 2002:aa7:db56:: with SMTP id n22mr5672038edt.4.1606742587880;
        Mon, 30 Nov 2020 05:23:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606742587; cv=none;
        d=google.com; s=arc-20160816;
        b=yIDAjBMjJzhVhHt8YyLDvBQYwDxbGH4yf4Vlx5WFViLNVtvehYptcgmyNEAOhuN+09
         OxkTj2MjCzgE82c2OirKlYOq8I1EyLFSIg18PzXq8iRY4STgZyeALkmbP3v53OijYkfi
         DZkEFRkdXEjjeMvAYToZbI2xiU3aO+gh0iYnAPF54FHd4n34Ux+lr1PjqSfZZS1LLIV7
         gUbdKVlcnO6pahVHtNUqmoN6/tt3MmAhUxZ8rgpIvnXI4bkV3ABfdYyc2jPhEA9dDymu
         CZDiL3FT9XXKryydlesbxUF5IJ9DBqmombWluf4wGMp6ybwqIBRiTJVFxO+6JJP5ARxB
         Y6DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=7oIYZY2rPTF6wB6vWVwG0IkpTF32U2iQmQ8YCaa/Baw=;
        b=b4i8De+UUWITYT7GiGvlSykk5kcyO0uYCwoVghXErODGwtot3UkJvxL5Q4C4Hk+HGt
         msCvfMf9M3M9nvvno15uQ8Gi7zXZJgQt74VMbBBLaEBrVMck9lVLhqOwaWZavjzifDA+
         5UNzQoE+xFOlYBoKfn7teHsAiZ0VL4INJrlg4unUZXg+GiLOhqQtyzsj+Wg96581diep
         KDSrTFTQCOSD60DScetKflXFXcd4tei45+gS41uzVwc8pT+X+9rdQTiY4CNM9icgq/4Y
         OvQ5trlJWGgzfaL4PUFcbhw8Ybat8SV0uJVjo42MBOYjRITNth0kegv8wVfjs0agNUy0
         ZFWw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id i6si198727edk.4.2020.11.30.05.23.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Nov 2020 05:23:07 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0AUDN7Sp005879
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Nov 2020 14:23:07 +0100
Received: from [167.87.39.132] ([167.87.39.132])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0AUDN7UQ012509;
	Mon, 30 Nov 2020 14:23:07 +0100
Subject: Re: jailhouse: request_mem_region failed for hypervisor memory
To: Sainz Markel <Msainz@ikerlan.es>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <PA4PR03MB71849151EBE032D778289555B6F50@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <b2243b44-31d8-5e2a-5080-6658b5d1ffe4@siemens.com>
 <PA4PR03MB718417E5C836D059FA4DC909B6F50@PA4PR03MB7184.eurprd03.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <36eaf13d-b428-8cc9-45df-9386b7d82c23@siemens.com>
Date: Mon, 30 Nov 2020 14:23:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <PA4PR03MB718417E5C836D059FA4DC909B6F50@PA4PR03MB7184.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
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

On 30.11.20 14:00, Sainz Markel wrote:
> No, the content on /proc/cmdline is what follows:
>=20
> / # more /proc/cmdline=20
> console=3DttyS0

Then you need to talk to your bootloader, that it eventually accepts
your command line extension.

Jan

>=20
> -----Mensaje original-----
> De: Jan Kiszka <jan.kiszka@siemens.com>=20
> Enviado el: lunes, 30 de noviembre de 2020 13:32
> Para: Sainz Markel <Msainz@ikerlan.es>; jailhouse-dev@googlegroups.com
> Asunto: Re: jailhouse: request_mem_region failed for hypervisor memory
>=20
> CAUTION: This email originated from outside of the organization. Do not c=
lick links or open attachments unless you recognize the sender and know the=
 content is safe.
>=20
>=20
> On 30.11.20 11:31, Sainz Markel wrote:
>> Hi all,
>>
>>
>>
>> After being able to compile all the elements, when I try to enable the=
=20
>> cell, I get the following error:
>>
>>
>>
>> / # jailhouse enable root/jailhouse/configs/x86/sysconfig.cell
>>
>> [=C2=A0 142.758697] jailhouse: request_mem_region failed for hypervisor =
memory.
>>
>> [=C2=A0 142.760507] jailhouse: Did you reserve the memory with "memmap=
=3D" or=20
>> "mem=3D"?
>>
>> JAILHOUSE_ENABLE: Invalid argument
>>
>>
>>
>> I=E2=80=99ve appended to the kernel the line =E2=80=9Croot=3D/dev/sda in=
tel_iommu=3Doff
>> memmap=3D0x5200000\$0x3a000000 vga=3D0x305=E2=80=9D
>>
>=20
> Does that show up without the "\" escape in /proc/cmdline?
>=20
> Jan
>=20
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>=20


--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/36eaf13d-b428-8cc9-45df-9386b7d82c23%40siemens.com.
