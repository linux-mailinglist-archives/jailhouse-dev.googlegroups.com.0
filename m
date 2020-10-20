Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB44WXP6AKGQERT3R26Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA66293A17
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Oct 2020 13:35:16 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id i9sf299915wml.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Oct 2020 04:35:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603193716; cv=pass;
        d=google.com; s=arc-20160816;
        b=kt/BwipbSPl28V5q8GR/9lZzNpbnP00d66n4kTqVPwhw9ybfK4R+yw39wSy57RslEJ
         47rZPodhefrGbH/ezHcL6mRO7AHq2SA3QOnEZ+Rh9OQzcwGjI9OSpIlayYXHgkwGlsxE
         0bl9ozYZYfrj1h7taeLOFlz+jVnfvUcMx2fFFAbnKgbMlpnkp1ubiEFMm+PoKS39ztNP
         sTSjTAnv8ssnldaBVBt1Oc2O0Rk0b4BAOf66mI22B+lq32mCEYZkbjxml1GM4wKBU908
         6QTkVx5iCvP2YAWmhgqm3xTRHwMLNthJeGq+GEb30ZVKV1V9V5Ss60vvnXHoRiJIz7Dp
         06+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=wgg93FgyrJQ/E0JhffdlyAJxRMdVHiNtFqcG/n282QQ=;
        b=xhwSBm/zOHTjdEqG71rsImhd2Vy+uAh2v2J9a3RE2Ncuxv++4lGpYxzzJDkUsVZp0W
         C6cHoeBwHDqWTnUSP0dJKFD7MxiSFkqDSq2Rzbw/lUwOTlm7+/VDg1p9CL45pidmI7JR
         h4OzuXuHokJByrpm81ftHjRkF3bnMkHTj7CYfBxPRE1pKkTCrkR7BSaEL4c9Pu0ThoCg
         AGNaV+4FDb9pKsLFM2iuXCmNw5sdCDgU+INHHTcax2H6KcgCL7JxESo/PjbiXPWV7WX1
         0Ol+Qnj5LKVj36GS7+/FVtxwQVtaeaW8dv/sDJ0f8JqmFMqFfxBPyWOCXj50J42GfoQ5
         sa4w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wgg93FgyrJQ/E0JhffdlyAJxRMdVHiNtFqcG/n282QQ=;
        b=KljRvhQfAWnBA5BC8u++90ODKYBSQV7bOq0EQ6Fw/k7nYAnqlrhjvpGYvSjM72Rlo+
         TguhTouiAiWX430Ktrne9BQHwgTzgm4lorU3NdZmGC1jjFUhjl9nZIA45vEzATSJHc7Z
         vvML9RHF6UVx+OUlNTAUIzy2vuKvwzjrlen7JyypJwp5fh/Z5SeNbOF+47ZaZxX2iG9f
         /Oa8TfbyyBySKw3u5gAlnPl/jD8N/eONOLQrcNb35fw68/Q+dJlfF0298qzBevwcm9Jg
         d5hgPF717nIiBpqYbWDy0JEeTCZ0caBtdSlFmkqqntRGMRdn0z4SDrszwKRQOoJOVc64
         3fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wgg93FgyrJQ/E0JhffdlyAJxRMdVHiNtFqcG/n282QQ=;
        b=D4rV8SoMihcJqGuF5BioreuwfzBzJS9Kg8KbUQkJYThHuVesDwpOYKXyoZMjeJtW7P
         uIYAtVaDNQe3levPq1rguJYgJclXKBI4GsqG27fB72vsee5ocm8/Q5ra+A2vVCJ3I0b/
         Vv+txibkNi2mxO8EltgQQk7QQvOL+9RMWLGi7Ln4g9jHroCMDlq3RwOV8taqc+vHW/f7
         L5OZnlslFGtue8fySouhc48zc1WEJGosxR/T6LO3KvYppmBkiSgfPY3NfH0TfOayFrmz
         gvrdtoqbn+GAQVFKXjuHZAcyJb4ZjsH/iZSeUolxp+rpQNUsIFVhOUxefQ9Mn7EfYwSJ
         zKRw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531tgEPURsse/chlRCRViV8OtGqHG9UR4i/Nca6ngupmFcbtbG/B
	RUwH/6s05DnRfPgHyDP0u1A=
X-Google-Smtp-Source: ABdhPJwSpEjKny26zta1fAZLsejz4AjVZGhk0/GFGDfS4i9So8BxejxWEVFj6zUieCVTNBdzGgLqoQ==
X-Received: by 2002:a05:600c:2707:: with SMTP id 7mr2504751wmm.147.1603193716262;
        Tue, 20 Oct 2020 04:35:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:82ab:: with SMTP id 40ls899384wrc.1.gmail; Tue, 20 Oct
 2020 04:35:15 -0700 (PDT)
X-Received: by 2002:adf:e685:: with SMTP id r5mr3298854wrm.340.1603193715054;
        Tue, 20 Oct 2020 04:35:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603193715; cv=none;
        d=google.com; s=arc-20160816;
        b=ujlkfSESGCwy71/CPKXXxHf8gqLhTTvn8KtxzMi1w0rzmkElH8HLgddzZED6PD0crr
         x0NvLmcCT0H4MnqU+Ktpgmj0WOdcPODXAhUNTt88yTDwePDpWxhYhREcy5bVtV1y9aFF
         qD/5vNhv6p8wdUHC3bkKQTI9p104WqG5YicSfaFggv+vJsdRenBMGlbUqogHOR9hX3nb
         jAfGy0dBBprTQqvcc2LHQKNZQDmzq0Qnh174f/7ETt5hmgeR0nn5JobAcu8yPqqkKnT9
         weBGHfwE7SrMdptg+FdrcrAlClnuY3W1hY4eIeY+F/JXJEdWHYU+VcR98RMI38BE+S6T
         PYfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=YXM3gOqqxCH2CYDgFM7GB/cwh2txJo3NG1j8nIxQdjE=;
        b=Nr0cFEC8EuuZSvukxgQYUX2U/wHEk9ruL1C1HBZbDQBH9drZCeHFeDvQQLXSdAwOXn
         c4RIX3T4KGCXdcx9tEapznnkJv+PcjgXyJMcPZDbKZFNq0Tuqhsz64F5Y4tq3ItbeOIS
         hnXwUiAPqtvxIA36tTjyS/EshBWVvBI1AsolwfXPUi+QttcUDweTOcNRJMgYajagaBuI
         7TtFs1r3rPBsEyP76Q6OvEw7GOsHiODnrAPl2u3KvVIpwEtiR1d1jtxTY6ZrRputIEee
         NebhQPX83+XTlJWGas/2EbXkUNEOTrm5EaV74Ryule3/KHxDjAwNGgJv64gUIF6mgCnR
         jXvg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id o16si46620wrv.1.2020.10.20.04.35.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2020 04:35:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 09KBZEOQ002157
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Oct 2020 13:35:14 +0200
Received: from [167.87.53.106] ([167.87.53.106])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09KBZDtp017575;
	Tue, 20 Oct 2020 13:35:14 +0200
Subject: Re: Jailhouse in qemu and ubuntu
To: Jari Ronkainen <jari.ronkainen@unikie.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <cd0ba433-1be8-4c99-841e-d637d2e5fb54n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <aac32e08-476d-0046-f46e-20bf09fc743c@siemens.com>
Date: Tue, 20 Oct 2020 13:35:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <cd0ba433-1be8-4c99-841e-d637d2e5fb54n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 20.10.20 11:56, Jari Ronkainen wrote:
> Hi,
>=20
> I'm interested in running ROS2 in a Linux cell, first through
> QEMU and later on Up Xtreme board.=C2=A0 Apologies for stupid
> questions,=C2=A0 and please refer me to a more appropriate forum
> if this is the wrong place for them.
>=20
> First I have built a fresh virtual machine and installed Ubuntu
> 20.04 LTS, then installed linux headers, build tools and python
> through apt.
>=20
> The compilation and installing seems to work fine, but when I
> get to the point where I should do
>=20
> # jailhouse enable jailhouse/configs/qemu-x86.cell

That path looks like as if you are using a very old Jailhouse version,=20
before we put things into configs/<arch>/*.cell.

>=20
> I get an error message
>=20
> JAILHOUSE_ENABLE: Invalid argument
>=20
> I do not know how to get past this, any help?
>=20

It's not Ubuntu, but very close due to Debian: You can have a look at=20
the integration done for QEMU and a couple of real boards in [1].

>=20
> Other things is it seems like the documentation is not entirely
> up to date, and I noticed things like experimental virtio support
> and IPC reworkings in 0.12 release notes, is there any more info
> about those in the wild or should I just dig through git commits?

IPC rework was integrated, and you find the required drivers in the=20
kernel trees we provide [2][3].

Virtio is... more complex to configure, limited in functionality, and=20
there is no starters guide available yet. If you have a use case, we=20
should discuss starting from that.

Jan

[1] https://github.com/siemens/jailhouse-images
[2] https://github.com/siemens/linux/commits/jailhouse-enabling/5.4
[3]=20
http://git.kiszka.org/?p=3Dlinux.git;a=3Dshortlog;h=3Drefs/heads/queues/jai=
lhouse

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
jailhouse-dev/aac32e08-476d-0046-f46e-20bf09fc743c%40siemens.com.
