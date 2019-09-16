Return-Path: <jailhouse-dev+bncBDAMN6NI5EERBCGP7XVQKGQEWZ4MDFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C96CB3878
	for <lists+jailhouse-dev@lfdr.de>; Mon, 16 Sep 2019 12:44:25 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id w193sf7741064lff.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 16 Sep 2019 03:44:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1568630665; cv=pass;
        d=google.com; s=arc-20160816;
        b=QwyOdBAH9TwqmHXG/XiK68MSOGQ+wYxiUP4s/uzilyYTeGRcFeefTq5grFIZ/9aX/z
         pwRcP5or/ByDvQSwlMeWF0bgrYu0bsuQpDjIsKv3S9Lq8WeOIWg6Uwfj1rs4MZfU/lqW
         IgPnR/SSPcnP+pZ90iT9M/CK51COnPELK61sZR2Y0oACSfRZetmlC9Ug9feOiXTgTuW7
         dl5vFjD/XWxWmjXSWtZzXcHlfiXe04Y0u05JhafAQZqULAitMCRkG1SUJlZoZX4mkKlf
         A8dRXe8WH9GoWwreP6oE2/efhG2syLpe1lF0a7D1BgiM2qwriq1jb4jo24FyFBvfOmbG
         4mtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:user-agent:references
         :message-id:in-reply-to:subject:cc:to:from:date:sender
         :dkim-signature;
        bh=Cip0QbeLB2vToOxTcE02fXv00hWT4wmZ0QgYnVsPLOA=;
        b=KhOhsW6RooTQAgOkZDpQRgpJT1jH7l2ouHMJLGhhmwYA5Mtl4QyVWJBpbx9A4UtDqc
         oSVgr1F9grc1/fWdQ5GHbmiSIZMSRWwyOUi1J/+bh2c0Z2qxLPiHqvoJG/iY+gdl7MDB
         tijT0DUxCX5ApvLKIn2jHppRRnpViZrp6ABMiUu0qhmaUgT0K+zGHW4QIPnjk8FDm32P
         e7X6HMwt7NwHJWASu2i6bQr6aSmJplP/Az02uRNwtk+DpvgRg72/LzUJhwEeUADwKEQn
         DCXyYLLhVn94DiYfy7kSkKmSOU0gRtV/SLmXtne1FP1eFdjHiNSQFYd3//qWwR4j9+2X
         MbXQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of tglx@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=tglx@linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Cip0QbeLB2vToOxTcE02fXv00hWT4wmZ0QgYnVsPLOA=;
        b=hsUSesY5xNZwAWh9mzaELpoyP2TF5Pruo5s7T7CcgpkwVZXSolJF1jL722OD54npqG
         KgO2XdflcOvHL1/HXwOtZj/upD56zN14YqL5vsbO3m/GtDRKFkgLa8fVWGgYEt2QJHwF
         7ppgdVNpT7xJmMSHf7s1h6wU07l1+fwj4Grt3lT83+KeGGhCc+UK93HDtRSkBkBmKqDw
         QDhC31FBFalq4GNco4q/fNRAGCVl8KpEILn9x87kqR9Sf5aPO1YQL+TH8ehjOTps/ZQA
         2VpNm+5D6O05bYcmwGuGBKhd3Q7WjejkvbYnOxPxGlyf6LE5O8jGKeK/zaw1k3XgkYyL
         NQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:in-reply-to
         :message-id:references:user-agent:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Cip0QbeLB2vToOxTcE02fXv00hWT4wmZ0QgYnVsPLOA=;
        b=CDm4TeNE/uXEeE9KpezughNRgJ1jvpSX5jrhMEYbqV5qdA+3D0HkdBGgNCFLRvf5M2
         Vqt6GB7+9O6dGhVS/W+Ibe/0eQDSjuK+12nSw2obRHWkQqC1fHWviUJSFaMaF5Y1ql03
         J3qGcpxsmPvqQ+7KIZWQWSTALthOAhfhSglETKHxSKNOReauxF5wqgoWqrhhLYzgu6kp
         6Dc1QSsCrfDXnqymUsBW5zeNRje/EARVNLEIUyK3hEwhiWKHJiwTz7/HbTKkZnXzfxbf
         vEeDOX5A08twd+wLGWQ3wfDNfR4+UYghDh22zn5MBk0uXWIlVxpAcn30IciBI3ByhoKn
         RjEA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVkcrxSSMtM2EOVxmaOPetUvdq+N8DfQp0ucFHzf0pIVu9psN05
	c3X5vvSftKt4+ZKthKm77f4=
X-Google-Smtp-Source: APXvYqzR/FEIqkLzM3iJAeR4InuLJEhp+gzApqHei8NMawBN6jssvFhuY9ogzh4Zpn/FpuXhifREJQ==
X-Received: by 2002:a2e:4243:: with SMTP id p64mr37669344lja.213.1568630664944;
        Mon, 16 Sep 2019 03:44:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5965:: with SMTP id h5ls3592251lfp.1.gmail; Mon, 16 Sep
 2019 03:44:24 -0700 (PDT)
X-Received: by 2002:a19:4f5a:: with SMTP id a26mr37468861lfk.116.1568630664233;
        Mon, 16 Sep 2019 03:44:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568630664; cv=none;
        d=google.com; s=arc-20160816;
        b=VF1Ww70LcxnZ55yjTjJi97nqBK22XaZe9UVlilh0cdNAwveObdY/glLPgp+KDgwkeC
         eP84LYCB7chusPUlhVRQTh4Vy1KRfScAUbR7e7vshDxvxvWwTfna7xKvcpQOK9IUgpry
         E+od3urvsehyiPYAaaaZ+u9mnV9CRE6FqJpMaTK0xyoyMnCt9TocS9Nibk4rTBYqplKX
         TqTej2uFcZVhgrTwhLEdiDc8NbXTaThkd+mq2X5vYAVd0JSH0PE2HdfimJ8aWA8oov41
         64u/dRUw60g75BhajNM+i+eIMKSMCmY11Gq1SNIxZzWuK/F5erQ3Ru9ZnjE5iobn5lVU
         JSIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:from:date;
        bh=sN63+s7h8YXxMK6fuCe9T6UiGTGS1si9Z/Ql4ZTLqXc=;
        b=hp1he4Lz1mHNViRSr06K+QkI7NnjyTvzVyQ1GYHwcgcoAifyytca7Q5iFzbcGIa2cX
         WrwLDn9eF5ocmTcs2llqzIsR28vIigSUhusmKjH3zWmgEYfe4XKeDMAUws+u7A7joO0N
         P5yorfmN9m2BtY/OBKOs3Nmq975jKPUePvYee48CabYdnkH4A9wrL7xehl876Vb1IDR0
         jDAue7Ski2ssGC3csmyERq1XlIjy9+vOoTESQpbVoreKJwABqEehaZJAnEDZv6tja8R0
         BEG5fzKPrB923q8zDkLrx8hms4fAcb34VtFukEObU3KM4hUtsjODdchAlbXSeuS1FVGE
         CRCw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of tglx@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=tglx@linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de. [2a0a:51c0:0:12e:550::1])
        by gmr-mx.google.com with ESMTPS id x18si1728319ljm.4.2019.09.16.03.44.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 16 Sep 2019 03:44:24 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of tglx@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) client-ip=2a0a:51c0:0:12e:550::1;
Received: from pd9ef19d4.dip0.t-ipconnect.de ([217.239.25.212] helo=nanos)
	by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
	(Exim 4.80)
	(envelope-from <tglx@linutronix.de>)
	id 1i9oUW-0003Ko-1R; Mon, 16 Sep 2019 12:44:20 +0200
Date: Mon, 16 Sep 2019 12:44:19 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
cc: Jan Kiszka <jan.kiszka@siemens.com>, Borislav Petkov <bp@alien8.de>, 
    x86@kernel.org, jailhouse-dev@googlegroups.com, 
    Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v4 0/2] x86/jailhouse: improve probing of platform
 UARTs
In-Reply-To: <f54af247-b27c-d772-641e-4a752a264dfd@oth-regensburg.de>
Message-ID: <alpine.DEB.2.21.1909161241520.10731@nanos.tec.linutronix.de>
References: <20190909151030.152012-1-ralf.ramsauer@oth-regensburg.de> <alpine.DEB.2.21.1909161154030.10731@nanos.tec.linutronix.de> <f54af247-b27c-d772-641e-4a752a264dfd@oth-regensburg.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
X-Original-Sender: tglx@linutronix.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: best guess record for domain of tglx@linutronix.de designates
 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=tglx@linutronix.de
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

On Mon, 16 Sep 2019, Ralf Ramsauer wrote:
> On 9/16/19 11:55 AM, Thomas Gleixner wrote:
> > On Mon, 9 Sep 2019, Ralf Ramsauer wrote:
> > Could you please provide links which resolve via Message-ID of the cover letter?
> > 
> >        Link: https://lore.kernel.org/r/$MESSAGE_ID
> > 
> > These are way better as they allow retrieval via message ID even if the
> > archive URL vanished at some point.
> 
> I fully agree, that's much more robust. I chose mail-archive as
> jailhouse-dev isn't archived by lore.
> 
> However, if lore would ever archive this list, here are the links:
> 
> Link v4:
> https://lore.kernel.org/r/<20190909151030.152012-1-ralf.ramsauer@oth-regensburg.de>

Which would work nicely if you remove the '<' and '>'

Now if you also Cc LKML on your postings, which would be nice because
arch/x86/* is involved, then it would automagically be archived there :)

Thanks,

	tglx

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/alpine.DEB.2.21.1909161241520.10731%40nanos.tec.linutronix.de.
