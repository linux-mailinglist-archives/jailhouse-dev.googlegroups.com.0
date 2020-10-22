Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBQVUYX6AKGQEQNYGWTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A7C295C6C
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 12:09:07 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id t8sf218362lfp.23
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 03:09:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603361347; cv=pass;
        d=google.com; s=arc-20160816;
        b=NgAV8pChQyvFuM0eSj3M0m3svQFNSZqVSnEYBbogZffjRqgszrAfQDPnynsY34QJHU
         Oe3F+3J7y9xjcfNbQZGaJZdOJPpIcxPggV3IVdO2nvCT9vd9K2C5Bm1U0voVP1iLqX+n
         7Viz7ZgCYmwh2J25GdbOxe7NlRsNoXBRlpDv5/h2u8mONFl0u/smNlgiPCsELZkj4FWh
         MKTs9KfRL937oaL+brqlNnEDUfPBgW0MRmyBbZiqw0yvlp3ZAmpR1JnH0Sjsw5jJ+XO1
         juNNoBqgPAOuV8sKILkaQkpebH8b3NwTyPKCdG46f7Cbye5SW9X5jqJCG3SVost6SkKh
         j/Dw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:cc:references:to:subject:sender
         :dkim-signature;
        bh=kHP+Q2W1ZghAAw/FoeaxQ5S+fHNMQL9/0vg3z89cN7k=;
        b=XV8h+gLOp9AQ2xw9UWKSxY7+hOuLIND01jG0eQR9cFihWPBqxxC3sXSCB+BGO0iE5e
         nWbpR5twREr8Xw78HCdg3K0wFZunH5S8/5UNG3fOMniRKIecHa2P+PjigG1TVeFWILHR
         Cr77noxlH3elGpBDzxlOymbokgADHlr1CsSDexDQpLlQpkjWvNxWQVQnKZJXg8cXPcrJ
         0irqyDAiXh/fi2iSa6gKKHtlJNpLiTf8FB9GRHilM74UUT/0jd0duYOGlsld+ubw6KbY
         ol7g/RTvPFZZyTfyyzaPUDhApLTDkCUYvQtCyi2hdlWzl9eHUENi5JSnOr9ytyhf3sgB
         IzLw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=rvFsTmNj;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:cc:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kHP+Q2W1ZghAAw/FoeaxQ5S+fHNMQL9/0vg3z89cN7k=;
        b=c9D8G8fuDEFkO8SVwFzAZZ7sQ5qSBTNs2jhyRsD/aupuTK8XiaghI09irFFnNzGgpP
         Xoo/F8UP4tF6v+udmZvjLx3nEbrHct0kKn/cMNgxTSmpDhcREmKd4pCA8krZyTVi13wz
         G6QTvLPImEtpPUrC+n+MBVYqnyTbmcSUE/WYB+1dpiUMRLFMTRbwneXWBUjuDLi9C0N6
         1L1x8VgmEHi9ZwPFNOgTS/eELp4x/B2Jx57a3/+pUo/cI5Nhs/YPeovtvmpfstqmPZHH
         wiq7L+3O5pYPbCCk2HmwHHdJzBQVZtmJ08n3QMNcnngdSADMgr+KDG8yRv7X+n6G1a4A
         /t3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:cc:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kHP+Q2W1ZghAAw/FoeaxQ5S+fHNMQL9/0vg3z89cN7k=;
        b=JzIc+4WnQDEnLRHltOpcpK8gc+SznxyCbMvPUnVTnJXJhnHhPOGfUPQpMG8yxsRM96
         iV0rgT0P5XBgGgHIoyLrSANrx+DONic4qQlF3QFyL9G0btdWL4Aad+inukTIe5r/RuZr
         5+nFr1Twspi3uUscTdWKVJOslai8ee6XvTmuOl79ljdqQRHu57pH6oz8Z/taBuvbp/wz
         CDJ+hfnQnhRm/Hw3y2w/CwxyAM75sXXpJpmdOB3TgrCsK+a1kJItEwdITxsFBdVhQPT2
         cXOoswir2Z/m3cGG45SDxMsi2ibwpYAjTkB3CUuQ18+e5YJ7zB6rBIw5sWX5b2hlcWZC
         jrqw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532JSBY9jA1wNPg1HMjr79+C1sgoqchCQhA1UJekse8S/Qh0eGWu
	oBI79wQLahaWH6BCk5jyFeQ=
X-Google-Smtp-Source: ABdhPJw61XsYUK9gL/0jrDA/RJWu8mWBMCe7MPUD1fETxXMfisbdeo8BZP+DHpbUZ1bBQPeWZS/h4Q==
X-Received: by 2002:a19:80c8:: with SMTP id b191mr681506lfd.518.1603361347036;
        Thu, 22 Oct 2020 03:09:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5e61:: with SMTP id a1ls836661lfr.2.gmail; Thu, 22 Oct
 2020 03:09:05 -0700 (PDT)
X-Received: by 2002:a05:6512:3710:: with SMTP id z16mr609780lfr.504.1603361345882;
        Thu, 22 Oct 2020 03:09:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603361345; cv=none;
        d=google.com; s=arc-20160816;
        b=KiP7ZBooClo3u84nRUJCeRR9MNw0nhgZULPo4aFXg0quj1m3SnM/EwS7LP94WWhFyr
         xZ6gbAvxvg0AxW+fzhCtOstlYaL4P2vtcDrFLpljeeJqMRutrorwz4Oe1QSH0ScyEJyJ
         7ZCfiLuyDqwzLcOu18vgBW0jwh+9tETINYmIJemjNaFU8twJ8Ryj11wuLU3PhvGklp8d
         kX09/ttKfGPot18JJ4Aj0Rpgf4RbmilDDdDOMw1ldHE6XYiphdNH15b10DhBcy5XLtHg
         NqaPGXOktE7ZRfJBxQYuZ+Iz+FYebqQ81Xx29KArv3XSwDiUhO+NNh2E/8cYQQmz/avQ
         mUFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:cc:references:to:subject
         :dkim-signature;
        bh=Ze9hyJxUAG+GTg9QJf6RcyjESEFa6cn8KuvZNrHRkbc=;
        b=KGz8IW5Fd2gP1w+yGIsJq4niGZPO0s8hoH2kKqVCC7C+A//QWZ6NHUVF0FGesCY+Hj
         8NOT+rJHiUE48j1MNXyPV3LBvkoFWMU1HIdsL5dLOw44l196YFuSDgQuwK4curnIgicC
         uQcb4csGYmT104VcsykalGLPxm3va4IgL+t+HazYhDYwGQUihGIukWj2JIKjtYalAQqC
         6fXHUOZZKEy5UwFIvQE9WNoCmVNYaHIINbNQaeBavxBsLbYwJOVfMedEIGe5L0t1cH+D
         FcZy3YI2rWsLwsoz/iGGQ2BYmLYRNDVBBrDYhHvfKXyre5oVgO0vVnuUnIWnuqr00GW5
         Vvtg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=rvFsTmNj;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id e1si58576ljg.6.2020.10.22.03.09.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 03:09:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CH3412NZMzySs;
	Thu, 22 Oct 2020 12:09:05 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.978
X-Spam-Level: 
X-Spam-Status: No, score=-2.978 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_CT_PLAIN_UTF8=0.001, LRZ_DMARC_FAIL=0.001,
	LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001,
	LRZ_DMARC_TUM_FAIL=0.001, LRZ_DMARC_TUM_REJECT=3.5,
	LRZ_DMARC_TUM_REJECT_PO=-3.5, LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001,
	LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
	LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_AAAA=0.001,
	LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
	LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR=0.001,
	LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_FROM_TUM_S=0.001,
	LRZ_HAS_CLANG=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_HAS_URL_HTTP=0.001, LRZ_MSGID_HL8_3HL4_HL12=0.001,
	LRZ_MSGID_MOZ=0.001, LRZ_UA_MOZ=0.001, LRZ_URL_PLAIN_SINGLE=0.001,
	NICE_REPLY_A=-0.107] autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id E6Y9OSz7BZJc; Thu, 22 Oct 2020 12:09:05 +0200 (CEST)
Received: from [10.162.12.242] (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CH3402WHSzyZr;
	Thu, 22 Oct 2020 12:09:04 +0200 (CEST)
Subject: Re: Jailhouse in qemu and ubuntu
To: Jari Ronkainen <jari.ronkainen@unikie.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <cd0ba433-1be8-4c99-841e-d637d2e5fb54n@googlegroups.com>
 <b4510771-f6f0-4771-9fe8-50a39589bd88n@googlegroups.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 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
Message-ID: <8e259404-32c1-7e23-d790-a5c52d800795@tum.de>
Date: Thu, 22 Oct 2020 12:09:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <b4510771-f6f0-4771-9fe8-50a39589bd88n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=rvFsTmNj;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

On 20/10/2020 12:19, Jari Ronkainen wrote:
> I noticed that dmesg gives me
>=20
> jailhouse: not as system configuration

I'm hitting likely the same with Ubuntu 20.04, but not under Debian testing=
.

It seems that the .note.gnu.property section is interfering with objcpy and
causes the "JHSYST" identification to be removed from the .cell.

Removing the section while copying the .o fixes the issue:

objcopy --version
GNU objcopy (GNU Binutils for Ubuntu) 2.34

readelf -a jailhouse/configs/x86/qemu-x86.o
...
Displaying notes found in: .note.gnu.property
  Owner                Data size        Description
  GNU                  0x00000010       NT_GNU_PROPERTY_TYPE_0
      Properties: x86 feature: IBT, SHSTK

hexdump -C jailhouse/configs/x86/qemu-x86.cell
00000000  04 00 00 00 10 00 00 00  05 00 00 00 47 4e 55 00  |............GN=
U.|


objcopy -O binary --remove-section=3D.note.gnu.property
jailhouse/configs/x86/qemu-x86.o jailhouse/configs/x86/qemu-x86.cell

00000000  4a 48 53 59 53 54 0d 00  01 00 00 00 00 00 00 3a  |JHSYST........=
.:|

Maybe related to:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D906414

Thanks,
Andrea

>=20
> , but this is the example .cell file that builds
> with the source code and is used as an example
> in the README.md?
> On Tuesday, October 20, 2020 at 12:56:36 PM UTC+3 Jari Ronkainen wrote:
>=20
>     Hi,
>=20
>     I'm interested in running ROS2 in a Linux cell, first through
>     QEMU and later on Up Xtreme board.=C2=A0 Apologies for stupid
>     questions,=C2=A0 and please refer me to a more appropriate forum
>     if this is the wrong place for them.
>=20
>     First I have built a fresh virtual machine and installed Ubuntu
>     20.04 LTS, then installed linux headers, build tools and python
>     through apt.
>=20
>     The compilation and installing seems to work fine, but when I
>     get to the point where I should do
>=20
>     # jailhouse enable jailhouse/configs/qemu-x86.cell
>=20
>     I get an error message
>=20
>     JAILHOUSE_ENABLE: Invalid argument
>=20
>     I do not know how to get past this, any help?
>=20
>=20
>     Other things is it seems like the documentation is not entirely
>     up to date, and I noticed things like experimental virtio support
>     and IPC reworkings in 0.12 release notes, is there any more info
>     about those in the wild or should I just dig through git commits?
>=20
> --=20
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email
> to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/b4510771-f6f0-4771-9fe8-5=
0a39589bd88n%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/b4510771-f6f0-4771-9fe8-=
50a39589bd88n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
Thanks,
Andrea Bastoni

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/8e259404-32c1-7e23-d790-a5c52d800795%40tum.de.
