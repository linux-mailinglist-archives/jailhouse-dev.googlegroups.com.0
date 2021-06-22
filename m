Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB76TY6DAMGQET6CFJDQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 246943B0629
	for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Jun 2021 15:47:44 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id u16-20020a5d51500000b029011a6a17cf62sf9411858wrt.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Jun 2021 06:47:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1624369663; cv=pass;
        d=google.com; s=arc-20160816;
        b=RUevlAbLkWU0AOQavMyL/AnRASwDzIqdawaadRvbFg2xd6R0TT5DUuessrU7wV//QZ
         gcyvHcxJx01cedp6dVwxXN/yX6MViLlHlEm6h5a1Pg3/JdJiyVTXhQNFHODA0ehluQKx
         hdYU5B2eNOOpeVr4eId6mbCAsWtYGFAetacsU5fz2PFKx65dICqHnkbadubdj3zo/6mE
         umNP7uSEhWC1Dm5EmGCQSQPcl0QiCWvAu4wdzPR7XP+ZZk8zC/+9bDDuHVAEQZgNf9As
         zpBNRlRZnZAaBajQk3H8U3Y1MJatCG0bCVA7wwZYiDg6q3TnJfnmOnw98BObHgejnb/W
         d6cA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=qc9PLu73MTpVVkWkjlvookb6usoj7p4ZhR7jajSozYE=;
        b=RlxhNUae5sCu7uJBXjQ/vZA5sFVVOlGmtMudjlEVfBCiWKhIaxZxOsOSdMmfXamr6o
         G/RWu6QkGVsiOVyDsXBeloPNojhW+XWAMqQE5lWm6Pr+zZAF2YKPxcyfIxapErRciuCB
         D+itb3wCTvioh/D8sGO6jrbEbnbcikNV1Mzs0ObECxN6TIfN2SJq6HiJ1wwd+Fh7Tvt1
         B3BzXCAXiTZ6WYmub9K2aH9ZNTeETyWw5fjvbutH/0MNFO5oIwUteN0/M9KaXggbReoC
         Hq+wQN0HMNSTdvM4Jfj6QyPkB0WLxAGUso0IiHZepPU1ALHTnuCniRzydXuL8xkrFCqx
         /8qQ==
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
        bh=qc9PLu73MTpVVkWkjlvookb6usoj7p4ZhR7jajSozYE=;
        b=L7atk6HtwQ3zq0zQaI8Jfs6y63xvJQ/C7FFdMuZKwUvflYPolRCmn5OlzTBSsMsQm7
         eNGykgqRNee+yCc8KT6q+17SUeiLr8iPpuNlUEfcFqIJ2HUb+9W5IUV5FQiKQeN5UHDQ
         1u5O3URB6CgccFKzUvgk8eLy9BAvrsgvOupMMxuxTJ8Pfu0/mYiZPLmerLw6N2VX14IR
         M7HIykF+xqpJwAJvf61Z3jkMcz9hARb55twDvdtm9Ij8lRxi+agYhC/6Ys0OX30VnwTP
         9tDRUH3gKtf7aF1i0bUF8Zvtzx8huefqq2isf6Eb9VztpDoZDReCW/NhANX+Hv+QBXNR
         +Lhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qc9PLu73MTpVVkWkjlvookb6usoj7p4ZhR7jajSozYE=;
        b=rgokktY/pvH/J/ZOKizqMPphhQ9p/q0PZU+1ldE7CEWESbik+r4Vx1ZoX+0/mVUswD
         S5b/yi4YHjBIBTm3lXx3wtnYMtZQ1CTSaO7vmcvJTFVlaLUQfaSP7a2OlWvk7r4148ed
         3t0TW9iiVCO3DlfIQ6iuHMpNCH+p533x3wF9RYHOL4LOi+DTI7Ll7rlQKvSpL3g1ZXwY
         GZ5htqAbC48IIkeC7FAZqMlbU9RIA5oPTU1JY6PN7yhHvsyyh8qBKgbhC/MuIFXsZeam
         4Y2PqrIWbyevmBsTF+O7EAf8xodPTCtsA/6heckyZhj1z87VLjAzr8lPtEtvXppDmQRq
         U58g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532zwpdp3Lxt4NBW+YPxJhzM7+5GP1Bbi01xat639GnXmEO9j3RD
	IFyn09r4sBhxXFwMkt2MjM8=
X-Google-Smtp-Source: ABdhPJzdz+NQBU4ezzqgB2qLLQ6ghhO/I890y/ouaABYDvEWCSJNIcPvlMTVC7hh8wEzsL6tm+17aw==
X-Received: by 2002:adf:f1d0:: with SMTP id z16mr5022630wro.307.1624369663856;
        Tue, 22 Jun 2021 06:47:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:45c9:: with SMTP id b9ls1574795wrs.1.gmail; Tue, 22 Jun
 2021 06:47:42 -0700 (PDT)
X-Received: by 2002:adf:f808:: with SMTP id s8mr4779315wrp.270.1624369662873;
        Tue, 22 Jun 2021 06:47:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624369662; cv=none;
        d=google.com; s=arc-20160816;
        b=jjua613RHOTdC8RfqYWtkNvrDrBLh0yd2BzCSzohK0HNqS9ucJIKwI/ProvV6TyG2E
         LbVqLFWRuPe4cNH8XByC76FTmq8pVBiuGzdVj/mscT3e3kfYKF2LCWboFwBhZtnM7eKy
         Pyti329afP8XO45iZvqGE9CFIlVjkaSfA8Xgz/XPP6rDNQ1VC71d0BnwbV9iUwkehVLg
         A1Blj63xiOXx56l9y+0yNBmc1DeJFCnmRrTWggdFwIfCAQ0jxMEl9DvlJlZOxf8uDi5j
         AqmbeBAZx2YWSnro+4jf/2k3ZpL2WADU+tWsQxUJGToeQXTBxb0Dg9ilFVw3+yJYkTX6
         YLzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=lxt78g//8MQx0vIyMP3/gS8E9g54Zj8LahKMcwwPNe0=;
        b=JQP5r2XXDvr915iIDNkcLyZlRUfoo6bpNc7DW4+yK0NebcrSVWX0ADcudrMY8++sSa
         PbMj2et854N6cg8vV+30KzoVaL6O5rshcVyXXl6p5LgSi2IPP7iS09eCqgqctFMJV6eF
         I68CiIAsUc7VL8aBC4XqK68QNssMvvvBbOr4AyCchO5MANSxxvoSYy5jD9sYuwzM+FY5
         S9piuB45oPQtbP3r95CDgcLsdrghVIuDM7C8pYVaZITRwwV5BN9uWBfA9WVwkh+aXf7o
         XG/ULMNhLn4uyG4Zwq4YPmY2QzY9spfxT2isHFSzO7azttKwANZJR3H3cE15mRrHYU0F
         g94w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id k18si189662wmj.0.2021.06.22.06.47.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Jun 2021 06:47:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 15MDlf7w021534
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Jun 2021 15:47:42 +0200
Received: from [167.87.93.200] ([167.87.93.200])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 15MDlfTr030830;
	Tue, 22 Jun 2021 15:47:41 +0200
Subject: Re: adjust_irq_target() for root domain
To: Dongjiu Geng <gengdongjiu1@gmail.com>, jailhouse-dev@googlegroups.com
References: <CABSBigR3+yvpTCU2=YKYjX-ct-buuCh=WdkF9uZzT8vz=CWaHw@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <fd7255b3-59ca-17a3-1ce6-39dc3a8220c0@siemens.com>
Date: Tue, 22 Jun 2021 15:47:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CABSBigR3+yvpTCU2=YKYjX-ct-buuCh=WdkF9uZzT8vz=CWaHw@mail.gmail.com>
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

On 22.06.21 14:17, Dongjiu Geng wrote:
> Hi=EF=BC=8C
>    when the Jailhouse hypervisor is enabled in first time,
> "cell_added_removed =3D=3D root_cell" the  irqchip.adjust_irq_target()
> will execute two times, it seems there is no need to execute two
> times, maybe it is better to add a judgement to avoid it?
>=20
> void irqchip_config_commit(struct cell *cell_added_removed)
> {
>         unsigned int n;
>=20
>         if (!cell_added_removed)
>                 return;
>=20
>         for (n =3D 32; n < sizeof(cell_added_removed->arch.irq_bitmap) * =
8; n++) {
>                 if (irqchip_irq_in_cell(cell_added_removed, n)) {
>                         irqchip.adjust_irq_target(cell_added_removed, n);
>                 }
>                 if (irqchip_irq_in_cell(&root_cell, n)) {
>                         irqchip.adjust_irq_target(&root_cell, n);
>                 }
>         }
> }
>=20

Looks like a valid optimization, provided cell_added_removed =3D=3D
root_cell happens in reality (I don't recall from the top of my head
right now). Please validate and then possibly suggest a patch.

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
jailhouse-dev/fd7255b3-59ca-17a3-1ce6-39dc3a8220c0%40siemens.com.
