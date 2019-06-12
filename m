Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBJE5QXUAKGQE4TRKEVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CD542FA8
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 21:12:37 +0200 (CEST)
Received: by mail-ed1-x53f.google.com with SMTP id a21sf27148924edt.23
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 12:12:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560366757; cv=pass;
        d=google.com; s=arc-20160816;
        b=q1G20KEb6VeE6e+xR8yZo44b1PDX94MYHnCusmmce7ExfJjlraEvmmAt6BA9sCYldw
         k1WYLzxAe908lZ4eVlIMjVCSKCSNuipuNv4IMKfGPqLxUjLKYruKm7PgoEo3QYnFt3OK
         UqM1+7eOcOnj3n71Kzz2yl5lncNkJ8A7jLu0pIJqEtT/Ca0sEfIC392YWvwyU6qMf0Ep
         ubm/l2AUkaRS6DuamdeqFHhg8BrHvwUC193vfe/ll5zKEMLE8oP8J/Skuo6sh2skyeZX
         UbXmZ07cuZpU9OuFLIMwxuYJY32wOi2nWjcxDmeA6sTb9NZ/gmPeNBdr8k8zZNomjT/R
         AATQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:openpgp:from:references:to:subject:sender
         :dkim-signature;
        bh=WxgKHDn7oF5nwG8jXr2VJuArtP8Hsz6/7mU1jWidpvY=;
        b=NOQzkWL2iQLz0VObWRTTxa4F8lzKlFNqEBlMQVIhy4hijKnTz2ADpdxKaISQWYyJB9
         0IG9g92dBVkKcWHtItf8j+QShpuICgqOvCQievwT+Ok68ooiVOSVO2gMyTAuf5jQ5zL+
         NmqXX2ASezGaPB9XmA9YfUOqei5PuOw09dKb1sldrC+MbaRp4XatpBk1LsvpCh1p+Djb
         /DN6aKZfiKXobLGdOwjaaoWOxkDEMHEukdL5jMaVbhs7B/dQWS/oxhN3WIQOF0b4lhEd
         g2cdi0yWZf9Khpc57PovObhImsKGuMR4+iLBVRJkzgmLf9uA7SeQo1K1lJLXoXMOPKUx
         c/8w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=TecF3S4U;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WxgKHDn7oF5nwG8jXr2VJuArtP8Hsz6/7mU1jWidpvY=;
        b=bJpvuzLAmrZs4WKGm39+bva++XjBYg1/SRgTqybLaGjGqt/9BaKIJoLqUczU9dW1Gx
         ltFb6yCFxAugRlAwYpIuDbbWCULzBP2iqeM/cFpyCQVTyVIMWNa916Wcl/gex+C/9FtE
         V3rWwYNaqAewa9t2j7XrPRiy30yFZwQ5yxhX16IRGR1ZccAsox8+ec5eqa/OUt/hco2O
         DbPBR0rsSD8b8UotqC386cnvIfBWmqDldYkZpYgWHz6t96olWBH6Pyv9SosSv8D8iOIg
         697oY9qRFcEbwKbPIHvcOQ/4zp56VK3HVu6dFDfu205re6NkYnSe2DNYnMAcj7Ehn4OP
         GtJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WxgKHDn7oF5nwG8jXr2VJuArtP8Hsz6/7mU1jWidpvY=;
        b=hM/vRwJ9+9bnsqnC3CnVefRdBWddxO0c1SPfgyGm26D9egcyg99udRN534q6uIBPFm
         wFaHYDPnp8j0viZ740u0PAhzaTm4FjNru/2nCeBcQ61kSkh2IPJK7Fa5I5/pJWQuHiU4
         XLUHLvv1dx5BY0NReIcauVVhWUn/htDT48tg30J+/7NCKcXKuO6nYf8O8xmVJLDoyWaY
         HmscoiEX65jGdzugQATl7U1ELfvGVp/EaMo6Qcp/0cZzy2kWL47buOZ3UJKKyPHIxjfL
         DDX7xjxYSWuLOMXR8ESoBOE6bK1NQ7YTscvr25niuLh0jsCZN6TTfuDpS/v9QUOHj/xP
         wVKQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWr7vXCQY73XvDV4XD/OlIovD3pbmXdYLWLUCtmjDxcfb0vw3nT
	SSUizbpl8Fyguq4+0/3aTz4=
X-Google-Smtp-Source: APXvYqwljNea/LI3noZVuTr47BLq0ONmfqMwba5A3+P3NB3Vb4UuD0vJ9Gpo09F5oJRQKezqu/sEgg==
X-Received: by 2002:a50:ac4a:: with SMTP id w10mr68500840edc.33.1560366756933;
        Wed, 12 Jun 2019 12:12:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:6c4:: with SMTP id v4ls755631ejb.12.gmail; Wed, 12
 Jun 2019 12:12:36 -0700 (PDT)
X-Received: by 2002:a17:906:4f8f:: with SMTP id o15mr72226077eju.129.1560366756448;
        Wed, 12 Jun 2019 12:12:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560366756; cv=none;
        d=google.com; s=arc-20160816;
        b=btqkEIKIvwlO7yi+PxJ9VLW08bdelkOZGAdcWwqi/RQxxL7+FZcXb7StEuRKYkfjJ/
         RZSAyWGbLrLgltmaUcvHJxslhGDwUQWUheqDepLCWiohHCG281neXxdJGvEWr7fyex8Q
         fkFl16zhcv9nPY2/WFg5272UdNXD+gYkcGz13oo48Jv28SGwH5q+JBVx0b3UKJ3qGzzl
         cR6Y7zXHTx7zghFtL40AhIjkXGTF8cECEhA1Vu46W0xjjMLGA8MWansbMdRP3db0WKcv
         YWRpgIrrIVirghkqQS+2Zf4AbZ9c2RXPVZ6DZn6YLy/jVA9NQy3GKvSoAFWVQklji0U+
         UUrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :subject:dkim-signature;
        bh=gVKifpSi2ymsl8NeKiIpANs0PguaBe6I6nD3NH55Md8=;
        b=hamBAoKJccxBo5phpKyUrTv4dYhB5fBMLHdW6GfB56Rcu6CSNi3jnre4AU3Sc+yWwA
         RPcihEpZihyv9ZSoW8rX7XOhw/ZAFgBtP8BObYL9YqOcYFT83G1eqU0I2PsB8nE1Gade
         QnD4mx3p4foDe2EKGPi9mh7Ig3VYu/ApNE1S44ubQLZKDyW594RMYAFNWmtGOUTtnor+
         UZ4K8LEwTO/8Q2pTeR/IotEgobQElF+SLz45M8ZZ4TGnDdCBLSpdoQDSyQF3QB1PNqYY
         mq3J77Z3eD/D3oWMrRW923rjSoGtASf5aGFKaZNTrZiQvRUuOsFY/82VbLRd7FpP8Pj+
         qxtA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=TecF3S4U;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id z20si46089edc.1.2019.06.12.12.12.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 12:12:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45PGhz6ZD1zyJL;
	Wed, 12 Jun 2019 21:12:35 +0200 (CEST)
Received: from [172.23.3.82] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 12 Jun
 2019 21:12:35 +0200
Subject: Re: porting am57xx jailhouse support to v0.10 version
To: Vitaly Andrianov <vitalya@ti.com>, <jan.kiszka@web.de>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <2f1c216b-71a5-5a78-79f5-416b11539d81@ti.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <ace421df-a519-4509-2b97-6713009b85b9@oth-regensburg.de>
Date: Wed, 12 Jun 2019 21:12:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <2f1c216b-71a5-5a78-79f5-416b11539d81@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=TecF3S4U;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi Vitaly,

On 6/12/19 8:45 PM, Vitaly Andrianov wrote:
> Hi Jan, Ralf,
>=20
> More than a year ago I was working on Jailhouse support for TI AM572x
> SOC. That time we used v0.8 and everything worked fine. Presently I
> started to port that support to v0.10 version and found a lot of new
> features. The mane "feature" that you removed "mach-..." and introduced
> "units". Because am57xx requires to have custom init and cell exit
> functions I think I need to create am57xx unit.

Hehe, upstream first! :)

>=20
> If you remember, the am57xx had its own:
>=20
> int mach_init(void),
> void mach_cell_exit(struct cell *cell) and
> int arch_handle_smc(struct trap_context *ctx)
>=20
> so, I have to implement the corresponding am57xx_init() and
> am57xx_cell_exit().
>=20
> Here is the old mach_cell_exit function, but many of the functions it
> uses disappeared in the v0.10 version.
>=20
> void mach_cell_exit(struct cell *cell)
> {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int cpu;
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_cpu(cpu, cell->cpu_set) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 per_cpu(cpu)->cpu_on_entry =3D
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio_read32(wk=
upgen_base + OMAP_AUX_CORE_BOOT_0 +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu * 4);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 per_cpu(cpu)->cpu_on_context =3D 0;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 arch_suspend_cpu(cpu);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 arch_reset_cpu(cpu);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> }
>=20
> Please could you help me to find a example of similar function for other
> platforms I can use to implement the am57xx_cell_exit function. W/o it I
> cannot bring the second CPU after a cell destroy.

Almost exactly a year ago, I removed vexpress support. Vexpress used to
have a similar pattern. Before I removed it, Jan converted it to a unit.
This should give you an example how you can use it.

Have a look at aa9a67d63f326a89294781acb7b1562f54b0538e. Does that help?

  Ralf

>=20
> Thanks,
> -Vitaly
>=20
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ace421df-a519-4509-2b97-6713009b85b9%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
