Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBBOXTLZAKGQEWQTKBSI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8ED15D92B
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Feb 2020 15:15:34 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id d15sf4101871wru.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Feb 2020 06:15:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581689734; cv=pass;
        d=google.com; s=arc-20160816;
        b=EYKz7vSC0LyzMUmcMrH5cnxvvolIlUT/yxERBmW41s41hcy6/7mdsC0WljMxWd+Iix
         JpxQSZ6YjVh2e3jlrPCtxYN902qmHF37mtHfrJtJFHXtF2ygp7IIllFtbUc0gNgcHCx/
         MZPo/ZyaAurTzv633UKcSI7lyKTeAFWBp7GpjzrIFeW5zgZoCNraxQaCEUWLWU2owfIA
         KXWf3LhzfefX20HIbI39BMSziQRMGSVG3GT9ZfC+IyfSGqzfPyQoeVt/BtWublKoXLhU
         BGjeW/doUhBjniSNHn3QyTUPH9ZyJgCZG731Jm9rtIJOUlxM/dWWvjovNzL1MfVRMxp2
         J1HQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=yZk8DUrWOx//0H3nFSCtzs3nBmFT4Pof+KtKHa6Oc0I=;
        b=vELD51FYKe1bWApz0/S8v4ELOSM+v17srRPTFKRnawBFOqgx8taN94CCELg410vGpM
         AUPIFsnBkQ9SRGNcPKDvYedPM0GWUDyoLwC9bRNKXBjZd2WgchhZVAYFIW5mN8SgCwMM
         0JAO28c8pdJnvKP2rGLyQNRwPIS6y2/Ko1T1Auc/zBf1OYfU11pGpOtCSiivSpboNDtm
         TCDwRJZr46JBgsIcaJ+wbHMxHSI+mVnJvK648f4cIMQ7kKP+WfaH0ZXKkYVnHOSL1aIu
         dpK1XWoa39ebhds138Fsihjy7a4vyFSLgse+wJfoAQXHebRgEOyIvTivkIuM3k/wWOgj
         zv4Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yZk8DUrWOx//0H3nFSCtzs3nBmFT4Pof+KtKHa6Oc0I=;
        b=QwMovYXbqb0+sXtHbpJGMITbKH54sth+ow4hcWbDGtMz2KoETLIOlLP9YgbmI3F5sT
         tJZ+4B4D4NfclXV7H7Rsbrz+XOCLSIJGrlwF0jyfpWJ5LQ2cVIk/0QaN0BK8bYnm+zEL
         ONo6s1/kLxGR5bxwoSukrHDbd/MPClBVTGH/TIBA0gUjses6CvAtq5PGnW1qOCL7aJSp
         w5zu9g25aNbCttUFurp0OTgC8iM3bSI4woK/YOoMbp4AYV2XtQof61/6nABol4pGJJsl
         9T/Cq+6smKRrvr2C0ncXCXgXtiebcELVa6QnbLkxC9LqWl9RIazCjBTvsTsA1C8DmX2r
         IRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yZk8DUrWOx//0H3nFSCtzs3nBmFT4Pof+KtKHa6Oc0I=;
        b=Bg2X2tqwDywSR6/Uk2N4uNmWHMV+l1desxqSp5IEM7T5SL7BoerNwsFJFQ7OqpgLg6
         06a2ZCNaVllP2VhOwRLqoHXXicFX7aJESlkFvEaawannvwXWAYVkY8mmp42on9lBwjtr
         cGDORp2rVXVyT5N+iQw6T2Pbf25LqYOYbIxinetL42EF4yce74EK0Cc/lYmvy9F4fr9z
         pKc2AOz1cVpIaVeONBN9M31dBGZHDgtie5GFjlkbfS+9JsLc2x6vIRuAcGVOzFWCMNFJ
         t30c8coK+T3mvQ9EuZqCdjByGCHDqZd61mMD1k3a6c1Et9CNr6fD4W0Id7kPkOtbNzVJ
         BaeA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVjJ5p8EEwrMkrsdn962n1eiNLQUE8To9rSG7OPB2eoJfwbwSBI
	ilJAmnUCID5ouAPUiChC0Bo=
X-Google-Smtp-Source: APXvYqy8nIji70DguKFPcGPoT2j3uvT4xeu95sX+ZDeIXjzOkE1H2D3lAj392MdHHv+eX9VF030LZw==
X-Received: by 2002:a05:600c:146:: with SMTP id w6mr5182730wmm.180.1581689734104;
        Fri, 14 Feb 2020 06:15:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cf15:: with SMTP id l21ls437406wmg.0.canary-gmail; Fri,
 14 Feb 2020 06:15:33 -0800 (PST)
X-Received: by 2002:a1c:3d46:: with SMTP id k67mr5100857wma.171.1581689733005;
        Fri, 14 Feb 2020 06:15:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581689733; cv=none;
        d=google.com; s=arc-20160816;
        b=LTd/j/z4+VjxNUVi6X/ljGvTu0wi4qRdGjW1IDCDguHfOJLn27XNn2DMtA8qdf5/A2
         peQrRGF/akLLMMHMuzDvrjKVBN/cj3o3et0SBUy2r+o1N53+VVaA93pNKjhc9XN8Apt3
         tC/urk6wI+mpS7DiPtfUGdGqbrZaV2DAXeAklbA8zW2TwiC1zfPBZW2kBrBI/vEGMiBi
         MwyypVUspwMELsow4h/9/lPwvznY/kf61FpCgxsvbIhs3XWXLdvECX1rWa1iHj/H79Yj
         Ic0dwzN4JnTgT7MS/8P4yzjxLXa8RPjAQmaKcDsP1LvAyttP9w+9ExKC/Zu4NQWHi5Gm
         UyLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=bt92NtMt+JUofO8H38rIt/unKmYe1EEcAYD+58M6RyA=;
        b=majBNfAYYKUYXoQfZ6LDduKK6iCNtfLz1qqT716BbngnwJtuIZCaldvu7oTcTPLMvf
         g1N5iqvXigi/NbOGjTxiOelWJE2EYmHEXdZnt86Ca6804i6FYMltBVNsi3gjV90wU+6y
         ayYmibOO+twWkPVwcwsEn+oq2diH11xpmaPftNUroq/qTIaXk+Zsg9ZNr0kQwKIo/rmy
         9duY/K2Ql10z9wXDp7LyrNFu0NGB68xR0PNNXTxdSi5A/HP1dz3Dh4edVsIPHAOCd54c
         +vvFUGWb/FS/Mw2SaOyaL+N6X6OhXEphuVgfP4H7Kpvu3AjtVJyvXgUDFKKIzjpCdqwP
         Mgng==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id y185si97744wmg.0.2020.02.14.06.15.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Feb 2020 06:15:32 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 01EEFWLR013889
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Feb 2020 15:15:32 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 01EEFWr5017961;
	Fri, 14 Feb 2020 15:15:32 +0100
Subject: Re: Linux non-root cell tooling
To: raymanfx@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>
References: <2b9c213c-a111-4f3f-94c5-4f89d06b5fdf@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <eebfa055-f561-d5fb-7da6-706bb1e858ea@siemens.com>
Date: Fri, 14 Feb 2020 15:15:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <2b9c213c-a111-4f3f-94c5-4f89d06b5fdf@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 14.02.20 14:31, raymanfx@gmail.com wrote:
> Hi all,
>=20
> I'm trying to create a non-root Linux cell but I'm stuck on the=20
> userspace tooling apparently.
> I can run the apic-demo on x86 just fine, but trying to create the Linux=
=20
> cell yields the following output:
>=20
> |
> $ sudo jailhouse cell linux linux-x86-demo.cell bzImage
> Traceback(most recent call last):
> File"/usr/libexec/jailhouse/jailhouse-cell-linux",line 850,in<module>
>  =C2=A0 =C2=A0 cell =3DJailhouseCell(config)
> File"/usr/lib/python3.7/site-packages/pyjailhouse/cell.py",line=20
> 36,in__init__
> raisee
> File"/usr/lib/python3.7/site-packages/pyjailhouse/cell.py",line=20
> 33,in__init__
>  =C2=A0 =C2=A0 fcntl.ioctl(self.dev,JailhouseCell.JAILHOUSE_CELL_CREATE,c=
reate)
> OSError:[Errno7]Argumentlist too long
> |
>=20
> I have been following the documentation from here:=20
> https://github.com/siemens/jailhouse/blob/master/Documentation/non-root-l=
inux.txt.=20
> "bzImage" is the compiled guest cell kernel. The linux-x86-demo config=20
> was not altered from the default one in the GIT repository.
>=20
> The version of Jailhouse I'm using is 0.12=20
> (92db71f257fabd3c08fa4b99498fa61a41ea831d).
> My root cell config and all the other stuff is the same as stated here:=
=20
> https://groups.google.com/forum/#!topic/jailhouse-dev/p0fcHAib0rw.
> Right now I am loading the driver (jailhouse.ko) as out-of-tree module,=
=20
> but I made sure the version matches with the userspace tools (both built=
=20
> from the same GIT revision).
>=20
> Cheers
>=20

You likely have to patch the ID of the ioapic in linux-x86-demo.c to the=20
value used in your generated config.

If that doesn't help: Youcan build Jailhouse with CONFIG_TRACE_ERROR=20
(see Documentation/hypervisor-configuration.md). That will report where=20
the error is thrown and may give us another hint what is causing this.

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
jailhouse-dev/eebfa055-f561-d5fb-7da6-706bb1e858ea%40siemens.com.
