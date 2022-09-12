Return-Path: <jailhouse-dev+bncBDPMZV72XQNBBIU37WMAMGQEEIXSSIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F1D5B5CFE
	for <lists+jailhouse-dev@lfdr.de>; Mon, 12 Sep 2022 17:17:56 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id v4-20020a2ea444000000b00261e0d5bc25sf2132834ljn.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 12 Sep 2022 08:17:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1662995876; cv=pass;
        d=google.com; s=arc-20160816;
        b=k0S1Keh5RZJpJGC8qFPUDYn8HRABLeYW4nYaa6JDfQdnGbZ++AgmWtzp2R461pIEAu
         R764bC9J1w93+ZpzGULz2+bteN5ALPK1v7GC3KbIXmSlovJ8tOuXcW3N7c8AFSu+ZEMD
         HDDsjRxEFj2t3Blt5C2zx1RDPSe6PB2TYHv8NITJD8OAP1A73FJFNMHy4dGNZKed95hc
         dWLMgpl5SXcMTIpBTlGs783qOwxpf5E4nRTCGKoeP2g+M1SFGYAUO9R6+PaeMtXoT4dc
         LIsIEIVmyXpM7lIzfOD6tUy25JnfFtItxIsx3i1xVyd6wc4WqxgUvPwLNWTVKfzWHopr
         Y7Fw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=y4H/atLu/v8uvBFEnA88JslikeCtUru9PVji4kkU4nY=;
        b=Do8lP8dMrnUwLjupXog3TZPJV9bYmEYLq7XQwGkOclPy/ZPKx0Or0xts3bDAsqpQTT
         XW8dmWEaN6+gcCesPR+gwNSIEaSvBYhMQMc7A663t+0dl5/b0eMUmvQGv6C84M4oGHpX
         nIg049ypbcKs53DmTye3lMDo6dyx2U1VO7obkUW0TFZF/SGzZKAHJEtxJfqHC0bepMfV
         W7NkJFi/sCeJQGdw13y2gFc7J6Q4cMzwqvZwXtvjLFn8Pnip/T4eNY1u+EH0k1NyXB6V
         +YlV61qCx/qkgQo3z0F1MdFrjQmJw6XoPGidtzqJLNLwgvkKC2q+x1SNA4BLc37+Un11
         DU1g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of wei.liu.linux@gmail.com designates 209.85.221.51 as permitted sender) smtp.mailfrom=wei.liu.linux@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:sender:from:to:cc:subject:date;
        bh=y4H/atLu/v8uvBFEnA88JslikeCtUru9PVji4kkU4nY=;
        b=iBa2TsvgHXj58vdVeq/y3bG+n2l4yta3/CTZxOTcegd+MfKlamYupsGlg91DhHOlM9
         jGolYM9BnbDC+OtQR8qeczLoJuLcWRBvKZgeSywTQb1/IttcrmPqydWb+HiTcvQds4dy
         PllhBKNIDF4YWrYO45yfXIwcPS1DR9loS/BacBOHGkxKUNrH3aw8QXi0STvuwclmjAu+
         4Gkk/EOsXFHvg/NO6eGzebGwws76pK67hsJ7QgyIwrm1VEr6h7bXq2TuD6L6hKve0Bhn
         QIRjvW/LFs9Fgro417hysYX7DUf0oTBrcgc78KU11/wyJykwUG3gnULZf5+wxveR0m+x
         bwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-message-state
         :sender:from:to:cc:subject:date;
        bh=y4H/atLu/v8uvBFEnA88JslikeCtUru9PVji4kkU4nY=;
        b=r8TvRPvTag/gqTyK7c8u+7HZmvJMRA4SBCWOISAU6jFeJlsJFpn1tVspJhhfG30P5x
         3L5zNFuRb1X1A/7rPrZUnRBamb11nvVM6ObtIM2GpUJnZnww2H4woabwlPTo+xeWbzY3
         vyEHtI2UqLqJ0wbwHQn+U0/iMLh8sLc2inb9Pv5sifctTtZgMa/hz9oC5lgtfUVv1y6K
         ENilYUdspK2RpI5SP1yXewjPkUuAff39VRUZdp8M2PnQeCeUY2MQpDfBBPfz4w9zHu2L
         WYGXxmLRIFrbstqWafvRHWyBWAdUX5Ul1/SSLCvzWUx+Fi2Z+odS+iTlo+yWgZANxmyy
         m1Iw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACgBeo1Y2QGNMaMVj4s5hL7IL99AIX42ZZYC5BXC/3aQDNUs8Oxr/laC
	z0UwrMunQZKczchfeWq5YWA=
X-Google-Smtp-Source: AA6agR5+2E6MGR6y98UbK0oNmySFiFMRnvrT1pfOUBcJioanf0EiERwavpHRMJuFszd2SuE+g94psQ==
X-Received: by 2002:a05:6512:11c8:b0:497:c19e:c709 with SMTP id h8-20020a05651211c800b00497c19ec709mr8393883lfr.152.1662995875862;
        Mon, 12 Sep 2022 08:17:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:5cf:b0:494:6c7d:cf65 with SMTP id
 o15-20020a05651205cf00b004946c7dcf65ls691642lfo.2.-pod-prod-gmail; Mon, 12
 Sep 2022 08:17:53 -0700 (PDT)
X-Received: by 2002:a05:6512:39cc:b0:498:4acc:2908 with SMTP id k12-20020a05651239cc00b004984acc2908mr7004608lfu.282.1662995873533;
        Mon, 12 Sep 2022 08:17:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662995873; cv=none;
        d=google.com; s=arc-20160816;
        b=HDNnRpTOXrh6mVMN85IwHq2LQf8Bzc+9K3F71shLFhbkUm5RYVpolu0CgH20T1KtJI
         4LLYAaQ2T9gQujnbzo6tyg52tTP8W8rScSvmVz3HybTdjCdwlW0v/9U75ZcC7+vDQ1Y3
         kETjElYvplsKM6GFmc/fNTgne4YkdPZp6930l91iUtd9oNmQzs83FEzAXjaGD2F8GgDC
         VS+lH/QY/DNsbKmznknPekxnyu+ZPJthFdL06QYyOFMpOVOE46MRjIPoWR5cvvCDf1L8
         PHZikQL4FjYFsPn8WbWi3iqcpP0q1ToZj7OLSmHZ/wHiAhxhKrPvT+1CHV2FanQfR+ny
         uz2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date;
        bh=rSdFp//FgK95mf2it0s18pZ/BW4X/WUoHMbm0UPV7z8=;
        b=SfW8GWOT3W236kdtnqF0GUxz4RQvEHUFOsyhHqDM7siuVhx6gZy1lT7J8ruZGiMR3Q
         IxBkOPCtDKesi6+/Ss5OdeVUz74D8yAjwjMa+N9AQxxgnGO5XKjampLZLt/luV25BIGo
         IXPtueJWXE0JcoAJsYcYQe8NcFSS0MhDVHk80gZzbztaHxarBdWES1K3f/bAps/sTHtv
         3SpjUY9qCiNzcbqQNHHAY5d5UiQxaD1LFGAYA4KMYauhz2V3AxzyWFqbIhov0ILsptx5
         NF1u3rb6AcyortiD3n64W8LDOcwWg/JNWUoEve0HUqTBDXVmnZ/HTYtE5RAh8uYaqonY
         KCoA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of wei.liu.linux@gmail.com designates 209.85.221.51 as permitted sender) smtp.mailfrom=wei.liu.linux@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by gmr-mx.google.com with ESMTPS id 14-20020a2eb94e000000b0026bea510aadsi216037ljs.3.2022.09.12.08.17.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 08:17:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of wei.liu.linux@gmail.com designates 209.85.221.51 as permitted sender) client-ip=209.85.221.51;
Received: by mail-wr1-f51.google.com with SMTP id k9so15965756wri.0
        for <jailhouse-dev@googlegroups.com>; Mon, 12 Sep 2022 08:17:53 -0700 (PDT)
X-Received: by 2002:adf:e609:0:b0:22a:a6fd:cfe1 with SMTP id p9-20020adfe609000000b0022aa6fdcfe1mr2001572wrm.0.1662995873048;
        Mon, 12 Sep 2022 08:17:53 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id l128-20020a1c2586000000b003b340f00f10sm10620972wml.31.2022.09.12.08.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 08:17:52 -0700 (PDT)
Date: Mon, 12 Sep 2022 15:17:46 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Ajay Kaher <akaher@vmware.com>
Cc: helgaas@kernel.org, bhelgaas@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, rostedt@goodmis.org,
	srivatsab@vmware.com, srivatsa@csail.mit.edu, amakhalov@vmware.com,
	vsirnapalli@vmware.com, er.ajay.kaher@gmail.com,
	willy@infradead.org, namit@vmware.com, linux-hyperv@vger.kernel.org,
	kvm@vger.kernel.org, jailhouse-dev@googlegroups.com,
	xen-devel@lists.xenproject.org, acrn-dev@lists.projectacrn.org,
	Wei Liu <wei.liu@kernel.org>
Subject: Re: [PATCH v2] x86/PCI: Prefer MMIO over PIO on VMware hypervisor
Message-ID: <Yx9NmjzeiyYsxUPT@liuwe-devbox-debian-v2>
References: <1662448117-10807-1-git-send-email-akaher@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1662448117-10807-1-git-send-email-akaher@vmware.com>
X-Original-Sender: wei.liu@kernel.org
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of wei.liu.linux@gmail.com designates 209.85.221.51 as
 permitted sender) smtp.mailfrom=wei.liu.linux@gmail.com;       dmarc=fail
 (p=NONE sp=NONE dis=NONE) header.from=kernel.org
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

On Tue, Sep 06, 2022 at 12:38:37PM +0530, Ajay Kaher wrote:
> During boot-time there are many PCI config reads, these could be performe=
d
> either using Port IO instructions (PIO) or memory mapped I/O (MMIO).
>=20
> PIO are less efficient than MMIO, they require twice as many PCI accesses
> and PIO instructions are serializing. As a result, MMIO should be preferr=
ed
> when possible over PIO.
>=20
> Virtual Machine test result using VMware hypervisor
> 1 hundred thousand reads using raw_pci_read() took:
> PIO: 12.809 seconds
> MMIO: 8.517 seconds (~33.5% faster then PIO)
>=20
> Currently, when these reads are performed by a virtual machine, they all
> cause a VM-exit, and therefore each one of them induces a considerable
> overhead.
>=20
> This overhead can be further improved, by mapping MMIO region of virtual
> machine to memory area that holds the values that the =E2=80=9Cemulated h=
ardware=E2=80=9D
> is supposed to return. The memory region is mapped as "read-only=E2=80=9D=
 in the
> NPT/EPT, so reads from these regions would be treated as regular memory
> reads. Writes would still be trapped and emulated by the hypervisor.
>=20
> Virtual Machine test result with above changes in VMware hypervisor
> 1 hundred thousand read using raw_pci_read() took:
> PIO: 12.809 seconds
> MMIO: 0.010 seconds
>=20
> This helps to reduce virtual machine PCI scan and initialization time by
> ~65%. In our case it reduced to ~18 mSec from ~55 mSec.
>=20
> MMIO is also faster than PIO on bare-metal systems, but due to some bugs
> with legacy hardware and the smaller gains on bare-metal, it seems pruden=
t
> not to change bare-metal behavior.
>=20
> Signed-off-by: Ajay Kaher <akaher@vmware.com>

The subject line should be fixed -- you're changing the behaviour for
all hypervisors, not just VMWare. I almost skipped this because of the
subject line.

Thanks,
Wei.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/Yx9NmjzeiyYsxUPT%40liuwe-devbox-debian-v2.
