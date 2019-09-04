Return-Path: <jailhouse-dev+bncBCUJ7YGL3QFBBIOMXXVQKGQEM32NPPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x639.google.com (mail-pl1-x639.google.com [IPv6:2607:f8b0:4864:20::639])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DBBA7CAD
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 Sep 2019 09:22:11 +0200 (CEST)
Received: by mail-pl1-x639.google.com with SMTP id p8sf1054785plo.16
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Sep 2019 00:22:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567581730; cv=pass;
        d=google.com; s=arc-20160816;
        b=AzSPKCevWp2MyxZEV4pwNEzZ6ndpZkGZIHSH+yjVg8LU288J4/v4VBKydeyddIhqJ5
         Qhm0Ubl5jNjoKmjU0Jdch8nSBSSMvcCODATKyOrBo9hkJNEyxwKaG43aD3kmMhRT8yEb
         xocYYPaiP5eFQSO0tzaEppMkcCSxDevAQdlWvy5AEjMnP5YLkZy7nedkFf6WacylrDSP
         fpv4k3wYIxFLwzfcjLrX0VJ2slo0M4l3vvPYK7kN6NswvUkz0iZ83x40kNAbr1EBY5D8
         I6Lba6fSBXEwwG9WQGp6Aon4iNgR+di2tv7ezglqUVepw1qo/8W5lUIm9gy6Iormmaw0
         VQfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:sender:dkim-signature;
        bh=EZa/AoIQym+DWHoMtZv2/ILTznPlKUPIogz0za2bMMA=;
        b=JE3gWDYyTHMBYRHivOoMZiFMTukp4NKKesbF7wU7Dr5O6Cxox/pVg2Aq05vJGS/d5Y
         H9qgsOqGTEagLZEjQl+Wt7WLDs69LBFKISjEkeAXu8JRzgpGEiMOxpb7FGGWLgS8pbjt
         ygKZmtB7E0w7kqORnR9nvI26VMMHUki+nnSMKHbXz2ufbfNRpex8qu95jpPVGnMmPtBO
         ijvSVeWR5659b8L6V/9ZFkz8DmipL1+nD2J3anHA7zOu/gmPxFwFFn0kCJz5Vh4XBgKP
         ZwFXUjJ7ZQllcxvmZZuRvOHZPiCuoK0tDKY/OWIC5A31bw9ynCG8yWsRHqg9W0Q0yNiV
         Vzgw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=iE4vcZxd;
       spf=pass (google.com: domain of gregkh@linuxfoundation.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=EZa/AoIQym+DWHoMtZv2/ILTznPlKUPIogz0za2bMMA=;
        b=F4Prc4PsLUIr+fC9XueEnRwjRaspvbNWFmTxeoRmAfSpQgRoxoDs05oCSYHlIEpYkN
         9GoynBKbEbADxwsg3EcAXj7Ts9aQS4P2MEw2fldmH4TR5As/hWQ5zX8nb/gDlNsJv9ZA
         RaiFAoZy+tFb1V38x9lpljyYTcfKnxJkQWx01i7ZvnUoZclY4bdgq7dWKWy34h09XLb0
         QtKtqasNm3/uRsbj+l3FuKXC+iwVhejRKgfy9EQBHqiDpWzyIaS7PxoXiRQMbRJui496
         4pO4bgTN0iyBxxDiHTzBd/PTknYknmLldMmsaPd3j/Rj7xJz6C6ByyHciyUMY+KA0X77
         2m5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=EZa/AoIQym+DWHoMtZv2/ILTznPlKUPIogz0za2bMMA=;
        b=EbUaYqX4XE3WHp6P+jtTfnD5zBNdsT/P7zvwWyk5U7cWpBpN9hOr3QpxwJj3/yfFwY
         GZqW9syn08RcygbF4DhKX8mqbk3wROdOvNX47sCQJfbrWT+/rpkfsI5CDaH/GTSVR1yq
         J2aUTalJbHXQ59Gk0YrA64v6AqPUieFXYPwhMfeMhmWn6LlIz43I0AZ3dJfX6op9fIke
         xxaBYWH8p5gCxYWA2nGsOhSf8yowx3KZcOPDSJdJdImUwYaiSH4PwNQUBhyI4h7ie5No
         Ypl9nIadpLo9bULts68E6bZ1LNBIyNbxS7O4AYs4pkF0ekOpTTdVxOZ1zk/rLCdmHWn4
         RkLw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXRGjXPXYKNMfs+R3RL6d5AaRB5+hLzq34cG9rglJOdqF6A3iGh
	Di96IFyEgGXp7uhQ0uwxWLM=
X-Google-Smtp-Source: APXvYqxfA3nMSZzMJbQpkeMOtAEVMOaJN4vr4o04hE7IdDYMaj84pPHQCgVZyA8lZwskjFHFRkE2nw==
X-Received: by 2002:aa7:86c8:: with SMTP id h8mr6827433pfo.241.1567581730507;
        Wed, 04 Sep 2019 00:22:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:1d91:: with SMTP id d139ls6440847pfd.6.gmail; Wed, 04
 Sep 2019 00:22:09 -0700 (PDT)
X-Received: by 2002:a63:2043:: with SMTP id r3mr18393580pgm.311.1567581729659;
        Wed, 04 Sep 2019 00:22:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567581729; cv=none;
        d=google.com; s=arc-20160816;
        b=0SXr89XtUqDm1p/xEyZY8QXaZKVvfvhFoirZ8yY5kCN/Uc1z14d8ZEDZZ0m4YUaSM2
         1iJN8xt11VHSnFwmnaZ8ewYV/4ivKgawby7A8MtOTfXvdNAKHp2OH//4wD+FUrhLcn4l
         MFjmOR9V5KwADcWDO+hBxyXBsJnjjWkvuOlmHYI5WRv06h2PIVRJXN7iqtFn07PYAulz
         RABN9Y7GgcbrWA3iru9XauJSCBvT38/ztsZYsfwBqIH6MfbsA6EOX21O4/3uU0X6+PsJ
         wcBqwxz9/vKpfLn2YO/QTALey9uBIyY08lWmabDCnJvpsHuVHMqi/0VI2HeAh/7I/AwH
         so6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=dq+IaErECKJf9qUyZetxSr61n750eWPWRBviyAc9B4Y=;
        b=CKjw3mW0aQjcKhBYF/tH1UWR5BxE8ycsSrw0nAvZq4+vG4IYFtSv91tPiqCOG+sapR
         unJ41pB27ADSSscjDQWuG43D6LGx+9LY2TOHyw35qgYkrqufNro9FAWsw4Nc3pyeNsWO
         7f7mGcH75TtL9B4v94ZsB00EAN8Yv4h3LQ2jmwt2PndLUe5tlR7oF63W34kJzPCeg6vz
         OOnoi+ZXGSh050mHckkVQFtMQ48ykRHfHr5ZKiImjagBrJrztJNBlgHUyywlG9CSQw8x
         zU3QrGE4OtSVf6T0IHDkCVItxJWMHrihihHjrbiwaVOImHa1V/xom9HMPJtad2TT8ki+
         o/dw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=iE4vcZxd;
       spf=pass (google.com: domain of gregkh@linuxfoundation.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by gmr-mx.google.com with ESMTPS id w72si1367771pfd.2.2019.09.04.00.22.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Sep 2019 00:22:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of gregkh@linuxfoundation.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C9E9A2339D;
	Wed,  4 Sep 2019 07:22:08 +0000 (UTC)
Date: Wed, 4 Sep 2019 09:22:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Jiri Slaby <jslaby@suse.com>, linux-serial@vger.kernel.org,
	jailhouse-dev@googlegroups.com, Jay Dolan <jay.dolan@accesio.com>
Subject: Re: [PATCH] serial: 8250_pci: Implement MSI(-X) support
Message-ID: <20190904072206.GA30185@kroah.com>
References: <20190812112152.693622-1-ralf.ramsauer@oth-regensburg.de>
 <740fc1e7-fb3d-c0c7-c17b-2ea3a8864d89@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <740fc1e7-fb3d-c0c7-c17b-2ea3a8864d89@oth-regensburg.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Original-Sender: gregkh@linuxfoundation.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@kernel.org header.s=default header.b=iE4vcZxd;       spf=pass
 (google.com: domain of gregkh@linuxfoundation.org designates 198.145.29.99 as
 permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
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

On Fri, Aug 30, 2019 at 12:33:09AM +0200, Ralf Ramsauer wrote:
> *ping* :)
> 
> On 8/12/19 1:21 PM, Ralf Ramsauer wrote:
> > There may be setups, where legacy interrupts are not available. This is
> > the caese, e.g., when Linux runs as guest (aka. non-root cell) of the
> > partitioning hypervisor Jailhouse. There, only MSI(-X) interrupts are
> > available for guests.
> > 
> > But the 8250_pci driver currently only supports legacy ints. So let's
> > enable MSI(-X) interrupts.
> > 
> > Nevertheless, this needs to handled with care: while many 8250 devices
> > actually claim to support MSI(-X) interrupts it should not be enabled be
> > default. I had at least one device in my hands with broken MSI
> > implementation.
> > 
> > So better introduce a whitelist with devices that are known to support
> > MSI(-X) interrupts. I tested all devices mentioned in the patch.
> > 
> > Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Ok, will queue this up, let's see what breaks :)

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190904072206.GA30185%40kroah.com.
