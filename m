Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHMZ7GCAMGQEEREOAKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 0417D3806EE
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 May 2021 12:10:38 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id z19-20020a2eb5330000b02900eeda415d13sf5197614ljm.23
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 May 2021 03:10:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1620987037; cv=pass;
        d=google.com; s=arc-20160816;
        b=gBCZH07uuB3NKw5yrSKrVKzci4Pe+GqR7jLmk/xp17M4LnPrqC7HRN3HwHTrC/MyzY
         tptOmhm+RcIWbsnNP58ZldOQy0XoHl2e5vD7Q5KjzpfxaiyNqukZ1aFRi0v4hJnL2F4M
         kYS/3HYWcRZr6z2cOk3YRmE6Y7KA9qlz/fEN5fxvkYgZqW/gUchoCsSEFMxhF9dUM1Ad
         8B1Ow6OnFspts79DyWTpoFNgdqPZ5DgOKMZL3nDH50gNhE1RAicmCen91f/3yeFOyHuu
         k4rmADnFSdbV43dvrTVUmgbajFZ+RxYIUUEVsOPs9oaEOXHiUyrgpEUOnFCHES5zjnj5
         kSLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=tlXZd8nbqpzBkNnMU8nkHV4rFPo7OfHSAqUU8Hlm6DI=;
        b=xDcNnhIVGqoaW8fGKlt1/UD8OSc0AiQ9pjh/kM0Q/Nwot6jAa8YCl2PLguqInr70U3
         XF5nmU2UZdbxG1dbRnnYmq7lx3uIEXVld6t/0zRfRNQ7i5Wz/7lfW6bItieuut+RKccG
         gV83QuD1TUNeIh7hfVAz8Z2Ri+Wk9RO5D0RP9SPiHAjklIC2q2rilMBsvI+lYJxwqYyr
         /65UCyIIq6qd2b55JafH5nqOv8C9TYmmb9IDE7WkX8zn5uOEctGLTqOrqiUJ1htXOrMq
         aravIXcHeULvCpeeLff6F0ipSyEiZaRT5OSvfINGV3FiWIqsh405oRjvkVRu/5eWlGcm
         Cm8g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tlXZd8nbqpzBkNnMU8nkHV4rFPo7OfHSAqUU8Hlm6DI=;
        b=i9Ne4vQ+qkLZGgeBM5Qa+UnOEd6u4odNMm3piI4REhkf/iYkcQ/1ZZdj9GN2IzYIDO
         EbGHgM8+OHbq5HRGj0Bucr+PUR53oPQb/tdYn9I+Tip5CfH9pPZiMEkB+uzQA8enjmv1
         iRAaRoGQXCcpVVI2GV2VkdlW8IocGtwOyD5ShNSS5M0+QkLpxsoFMmi+yWehXMylrOVI
         BILLcvPw9tJmI69ShuVXRiC6w2nE5fSLHoTbndQdJLao7XH85RuA0tmmgLfVEJg83Sza
         XTk+Hrujx0dW5DJzXkqALJ9HLyv3WFb5YiGOIL2wqoyfaxi8e2WArAw8njVx+3osMslR
         cPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tlXZd8nbqpzBkNnMU8nkHV4rFPo7OfHSAqUU8Hlm6DI=;
        b=iM7Gfbd4FjKDR6a9qtekIYRwgiS3qPSLGRvSYsxypqLiIJ9I/3VVyA5CeUnD+bOpfD
         F7HTHXsskLLxRwSjq6JQy7DrFRMdCJ+JqjpX8g65+OVVEsYSqgwekiEF+emVMdW4u4xn
         jAcGXaWfNoYIZQdZRX4xZdr/FeqehuE3AyanvQg95Eb3HsejCoTvkNiEisgGM89Si5cX
         AKB1MGQCSkwhG9oDnZkL35DkkHQ3ivzB2SZQqM7/HW5qeoIOssJwWrsbeSmSSgh3v5t7
         HpZwy7HdJvbXDqxqXmimghs2/fQ1JagK9HFzE7b29dW5DA+ja+r9/0NvTCepdyVp281S
         JXSA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Kqussk+a2teMl42lVS9GqCv+R1QT8zw1LK/oC4//GrJJoCFQ7
	QyQBHR0Crva7byZtSXpzrAo=
X-Google-Smtp-Source: ABdhPJzO/MFEM1KWxyS9HdxEWBxINehKwKCipbwUaJbuJUgRnw878iGjdzL+FKdJOnYVMPipoHRtRA==
X-Received: by 2002:a2e:a40d:: with SMTP id p13mr38266052ljn.8.1620987037431;
        Fri, 14 May 2021 03:10:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:6c2:: with SMTP id u2ls4465096lff.3.gmail; Fri, 14
 May 2021 03:10:36 -0700 (PDT)
X-Received: by 2002:a05:6512:45a:: with SMTP id y26mr31892669lfk.128.1620987036263;
        Fri, 14 May 2021 03:10:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620987036; cv=none;
        d=google.com; s=arc-20160816;
        b=GvAAEGgPQT+EmNGSMSIUuT8oOyZGMhvoPWVwfR3u93mRRzO/TARxzrIfNivWt90z0p
         3HqQeqR5HTU3CiNU42dFxOcDxpmi12QNPLL1n2ymxT6l9paavMXiMOh3tmC3nw1NeM4i
         hIdVjLSIx+Zrx+w1DpejCrUp1qukz5bqm7L9YeTEwkl5ozLi73NMxAfjrBFjzOgilJXH
         OUYY0WWlOjw284mrFz7MjG/BrXeAkKxNp918LBaP5CfEWfdSh6TxAXgd21O9nX8Wmfkb
         6BUZGrtVbnNxKF55stC+qU9IBQB68OmdJRJI9XfLJAbGNRTyBl9UK2FLjD0ayBzto3KS
         zxxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=oY0UDKqsBdqgEYxjToRXzEkKNxkRg4r4vi5XZjg1yF0=;
        b=ohz33PvZEqvUGapM0bT6o9PXRyua3dlpdz2qQLccWAbBq0oWnkDh4udJ/TADjSmnv9
         RMcW/qwc1y7iodOlNVDt32Kup5MWWZcbGqCKUXxjfpJrumUdYf4FYqE1IV07YZEpCpy1
         3Q4SSXVCrccpaw0WO/UcRDXCn/cqox8zym2q4TAxroA5SG+N6RBqrtT0m56LEZ4siG6d
         saQm28MqAxogY7n+lo5XkAtIpnXqW+u0mFzKSw/L3ULtIFuskyY2cmKvD+XCdPnGZ8tX
         esk6jik2FPqmo39yV/yFmjt5RFYZsEwoupLTsTMBgqADWhhqYJ1OdbXwOTxAiycBvWzE
         8dqw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id a1si233237ljb.5.2021.05.14.03.10.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 May 2021 03:10:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 14EAAYlv022737
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 May 2021 12:10:34 +0200
Received: from [167.87.89.54] ([167.87.89.54])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14EA3JKM010449;
	Fri, 14 May 2021 12:03:19 +0200
Subject: Re: How to partition PCI devices to none-root cells in rpi4b?
To: along li <v6543210@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <09c2642b-ba89-4226-8452-534393dc6a33n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d5e6079c-5cf5-ce18-45c0-d0eaa7d60350@siemens.com>
Date: Fri, 14 May 2021 12:03:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <09c2642b-ba89-4226-8452-534393dc6a33n@googlegroups.com>
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

On 14.05.21 05:08, along li wrote:
> Dear community,
>=20
> For X86 platform, the=C2=A0 tutorial=C2=A0 pdf talks some about=C2=A0 how=
 to partition
> pci device into none-root cells.=C2=A0 =C2=A0 =C2=A0
> tutorial:=C2=A0
> =C2=A0https://events.static.linuxfound.org/sites/events/files/slides/ELCE=
2016-Jailhouse-Tutorial.pdf
> <https://events.static.linuxfound.org/sites/events/files/slides/ELCE2016-=
Jailhouse-Tutorial.pdf>
>=20
> But how to do this in arm64 platforms, there is no=C2=A0 document.
>=20
> Well how to do this, Are there=C2=A0 some configuration demos ?
>=20

Plenty, though understanding the details requires a bit knowledge about
the respective platforms. If you look at
configs/arm64/zynqmp-zcu102-linux-demo.c, e.g., you can see that it gets
a UART assigned by handing over the MMIO region and (IIRC) GIC IRQ 54.
But, as I already explained, there can be more complex challenges when
you also need to enable / clock the respective device, and those
controls are shared with the root cell.

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
jailhouse-dev/d5e6079c-5cf5-ce18-45c0-d0eaa7d60350%40siemens.com.
