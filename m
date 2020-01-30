Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBMW2ZPYQKGQEA4NMTRQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CF814DD46
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jan 2020 15:50:27 +0100 (CET)
Received: by mail-ed1-x540.google.com with SMTP id f25sf2452709eds.22
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jan 2020 06:50:27 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580395827; cv=pass;
        d=google.com; s=arc-20160816;
        b=eTbgXxXzEYh9atqdLwaHHL/ZILYQjeQqbgM7bbJqz/Lsp69FUCxsdjcPZhH5YLBxjE
         FEYqTP7FzSrRLCxN+Q+pUJavSSGpAFMWT6w4ATmI1e0UejHlmkZDpYziPQsaEoBJb2Lb
         CslEhWHA/4EdmgHiMXtDaCr8ehlNW8wR4rVAQ0jbLwNNfuZVQ1QxFaWt++sci07q0Xc4
         1LG9/SrORgDNUkl8AG8hBJwxITshwhx0Ykah8fFV3os/TogaVfSzog+l6lzKfy9E0rgO
         pVpd7L1ArDw8lhLYMhfIDPX+aYJAsoKC3CVaqp8CpdF4F8f95+x/YecI2iHOVmbj1Li3
         J+4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=plKOx0F/wo75nqZpQXSNKLGG4fFmxLPHLnRCjNeqUeE=;
        b=QggrXQQ0enbMsppp66iTZxcF2guXDj8NxXGhTdkuXoXeydemk4jpwKkRhp7OhqLaHG
         94vzUUdvfp5GtXk/jgOjF3mmj/0UdDKjTaPfkWhwyxi4K2j9/Bw1N6r6WIckj3gWFW1u
         INRMUnviShfUZoRInPipH6uOYoZZcalR6Vpow1si+OSdu2g/ew9odTz5EFKzBSOtf83D
         QIdsBNgMjEMP3IrdU87hWvlFQP90RwdVxGnjMYZdV1Tfp++ORkr0sZgQ7D6SEO2b+5bm
         UH1K8YEO/BpxnZ8fGnYX9wbx2NKQLbZhcXIJDEDEm/9zRbIdKAIulP8ZABt5pKlS8+uK
         z4dw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=plKOx0F/wo75nqZpQXSNKLGG4fFmxLPHLnRCjNeqUeE=;
        b=B30uoDkr8kZ1A6nkt5bZ7ZdcNf+KadFlkLGAuZe0YWAxhZ6WJGb4s9hr5UcLd1WQ9x
         k2i/mNqmf3NJrv9wyeaqXK0xfk0jo9aV8MFqSHxftfNkPiI10DcaiPm38RTXuGeVLaLK
         flEQBKundavNT+5eMnxMpM3hCCKxDrjJF+fK6bM96M2SVxgJIXDbcT9Bb2ulrZ7GMtVn
         72MFjkNwDt3U2nL0M3K8BHoBXKM6hUv0jID/A6yywMTGYGLZTG3VGu9nMlYiEX47ZSJq
         TitUb/ZtaMs68YuNd53anAfsLWAAbDOMLguIfiYyite1R93zeerQgTCftGGOwo1BCdHy
         xJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=plKOx0F/wo75nqZpQXSNKLGG4fFmxLPHLnRCjNeqUeE=;
        b=eeUC3usNVxr8VHqPKWncs6lOhN0WnI1YYe1QNpGwX9ss1JSPZvEAMNKbpUSo2x9/h9
         zbVKf6OBBS/Q/l6zpXdj8X9ICQibFo+Eb1jHynnLMPPlAt0N+LSHXVR/Mz3NVOsICSBe
         b79UB8I2CQECGS50sgIh2qDHGwWpvYFE7J+l0x+L3z+vhtEpcoYEjsjxQXy9yWu5rWVz
         Cv03Ics0/H0aPxY31gWkHSaDa2yRBDwn/e3NkIYzZjo4O04yTWCil9RHItBnxH6SGvFw
         zH+lOq+UsTGJFkd4D7P7/QvSeR0VcIQR+xNgDMeVJuH4PuO577/EcKHFZe7xTc/7VVq3
         qkhg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUSyQ1uwn1X1vZEZ0fm+sz5ZR6BgECxcfRe0IpuZbypoTGT3pGU
	uq5KjXwc/G83JQyGderD60A=
X-Google-Smtp-Source: APXvYqwx/MWbDbUm3lqV7fXLieHX+K6u6+Wy5+FxGrNigZHDwiFSGvzn8iv7UyCwEQltCjLfshNYLw==
X-Received: by 2002:a17:906:3ce2:: with SMTP id d2mr4532116ejh.292.1580395827069;
        Thu, 30 Jan 2020 06:50:27 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:bfe7:: with SMTP id vr7ls1448468ejb.1.gmail; Thu, 30
 Jan 2020 06:50:26 -0800 (PST)
X-Received: by 2002:a17:906:9352:: with SMTP id p18mr4442988ejw.95.1580395826265;
        Thu, 30 Jan 2020 06:50:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580395826; cv=none;
        d=google.com; s=arc-20160816;
        b=BJnhqGliBcxMVRaVSpagj+sxcWxa4sHDfD/nKgWfkImQ6UWdiFzXkUVGOzFx6xRBXY
         8Q4aTgf6Oji4KLUu/YkMKBybLbhOKfGXyB+5QVyPhsLIrIx+PPn/zJq2ujMdOSyZ5RtI
         obwucTFQZpD7mrviHg5LITfTK3vOPat7rwibrmm+LCNO+73uCrc/Hi+9d937nN7Oip/k
         llL/PYoF+SlMDhPZ5lsYlwCIskBcDQ7YpSaxPLaj4hHKmUq+HhEKHG7yPrjliZ+GT/9V
         qLhh2bJgFJF+jU2jm1axmOSYhq5AG8TAQplAcsCR/DAUK6DsspWtFGqe4ergYiajAtbN
         GRVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=rkc5SVB7k1gLini8VFCGIDEdi9xJWzJznugkVBvqEwc=;
        b=D1bZ/JwVtYJH2DUaDHGKU4wEGvZjnbJPRdfhwuUy3nIvnaJLjMbiCsvorMv20PR0OC
         ugLp+W16VROQupKlviiIsXyO/gT/siCRk4u/6ccskSJMPZOKW4jPm45Q/XKBEIjyU1fx
         nLBCviGJlL7CHSa7hF9L3wkpUvZSkMldqPfEsbFduJYtgIDKHwFTTykDRJKNmeYcldbn
         hbzj/XCiLapxSwPxT7v7OskQUx9vreqfvoLViguMVYPfqMzFAhURIE7VeSOPxVF6OfBW
         kXalZp1Qwln6mGE5V3N3alLc2pBe35NGL6a38mwGWh+2Zer5ue0CocbWkkfebQ6hq7HC
         xzOg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id n21si271463eja.0.2020.01.30.06.50.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jan 2020 06:50:26 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 00UEoPZs019253
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jan 2020 15:50:25 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00UEoPmK017045;
	Thu, 30 Jan 2020 15:50:25 +0100
Subject: Re: Query on RAM regions in linux demo
To: vijai kumar <vijaikumar.kanagarajan@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <001789de-def6-48a6-992a-bfcdf07c756e@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f5236c19-ece5-dbc8-e52a-4a6a9408eb65@siemens.com>
Date: Thu, 30 Jan 2020 15:50:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <001789de-def6-48a6-992a-bfcdf07c756e@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 30.01.20 11:52, vijai kumar wrote:
> Hi All,
>=20
> I see that there are two RAM regions defined in ARM linux demos. One=20
> mapped to virtual address 0 and the other 1:1.
>=20
> I am not sure what the first region is for. Can anyone please help me=20
> understand that?
>=20
> For Example in qemu-arm64-linux-demo.c
>=20
> I am not sure what the below region is for.
>=20
>  =C2=A0=C2=A0=C2=A0 /* RAM */ {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .phys_st=
art =3D 0x7f900000,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .virt_st=
art =3D 0,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .size =
=3D 0x10000,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE |=20
> JAILHOUSE_MEM_LOADABLE,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 },
>=20
> Thanks,
> Vijai Kumar K
>=20
That first region is for bootstrapping. "jailhouse cell linux" loads=20
linux-loader.bin at address 0 in the cell because that is the default=20
start address of cell cores. The loader performs a few additional=20
initializations and then jumps to the kernel start address that is=20
located in the second, larger region.

HTH,
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
jailhouse-dev/f5236c19-ece5-dbc8-e52a-4a6a9408eb65%40siemens.com.
