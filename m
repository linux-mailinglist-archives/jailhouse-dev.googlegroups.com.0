Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBRXYYOSQMGQEFVCQMPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E37753357
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Jul 2023 09:42:00 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id 4fb4d7f45d1cf-50bf847b267sf1080255a12.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Jul 2023 00:42:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1689320520; cv=pass;
        d=google.com; s=arc-20160816;
        b=W4Lv1vGibsePePSNgGGQq2Wa4JQ8J+uDt6R4sKYzrQSzyELnFsBQoOhd5pvB2qn5XK
         lE9cvSTEnrEcoBHKOcKs9P2NTY5BLZpc1dkr3O8XQK48RbVh/S2HI9UDevIhd8H2gLs0
         BbsxTnUgGrGfpM0dURxCC/dgG0C6Aau+huNNWxy1k2nIYrzb26Rl6l7TGaHlYCH974J7
         MmdTgSS1cnqtTgbo2rLnIlI79ruWlv7yZfVLm1U+tiANrCIVttKnVTqq+MqSgv5o5+6D
         8Ojs/+3SsFJDpJFPOfkxbOBM4ioaGTIBgusHYhDJjebIpr8VrtNA2h7a5VcDjKETWCVn
         58Qg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=M+SUEkTJUjDkMh9EzDR0tD2SVrJ68zI9e06uetj1QBY=;
        fh=FrV6cpl4HCjWBPv4bD7daMcPSJruKZfBcVW/WO33Ffk=;
        b=DE2i1VLcygIIdtvzlTNcBxLAVSP2pOGOmIRSGOnJPaCWcTxBmVDH+gpxiDMUyZKhCW
         vkq6O5izgdTrZB3Wkl24AXogpahcc5VhxgI+METJfwa5kUcPUY51hyL2p6rWuYYDhggX
         ytWgvZdQD9Vp6EuwQAt6nwDYcB3cYW67TcDCvsnoEskfj1JSkMMxR/DJPAQ1zRq9EsFJ
         umLznYdKW8NsHomqeog6B3zyT/XARXuksIH+y1W55rtQQIySqnXZ2VX+mhVu9FVJ2evl
         ndynGPYCJgSZmQ4L+FOQWO0QipBRzn6RBs3BVewEIkT67j8CnBNnWUj4TZrbHjDDR0eZ
         Sirg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=DlgAQXnv;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1689320520; x=1691912520;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:from:references:to:content-language
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+SUEkTJUjDkMh9EzDR0tD2SVrJ68zI9e06uetj1QBY=;
        b=h07tA5nDFIGdarXvN8xljSIC7X9HPLf7tXg/N0VTTbsV9Pv7XlMZQSBnhqkNhG/3Yn
         AnUcYvFeBQ2ifTVIP/wb8HLPg17bQV215XhXQCo9lESKmM/ZMZYqyeGKwgvMmXG5/F52
         6mq/Vwh0cWJA0qsynPJVb+9uZqhlDWvQYBmKiaPVV2yHha9bL0/dZxObnM9f2vNwUUsd
         t9d3h+qPN9QOah1VQJDYsfv/bOzOyOL5M+cW/zem+7B0meO7WUl+Piar0O0VT6lkSPbW
         qE8mRl5We1yQK8YSUTm6IzgGvJpIPxUkDQS51JJjv15jMP0IsSOplF8QgEHwl3JcSJX6
         pNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689320520; x=1691912520;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:references:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-beenthere:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+SUEkTJUjDkMh9EzDR0tD2SVrJ68zI9e06uetj1QBY=;
        b=A7n+TDXoUMrkOzEAn4iEGhVqMdEfnu/h9EJ77LjlGcjRa/PsUN6ndXB4UmNHCwQ4m6
         2JTc2arrmMbcq8b4U+nESAGFKFVKooWD7K2IsdptRFn5jguD96W8EemsCElF/kCiZ41H
         FguUP4UeN6wUD0gVezfXA4nWsCT6nVjnOnqnm4BqdVt0V0GgH0EOMXEbBKoGv09JgX6e
         /hyZ/LF5h2bEkQ2bcwuiuCygSe4+FaSx/zT33WfdKQNTa2Ugwtt3wT2Mmn7Jpi6qa+nd
         NmJu84iDKflpjECLENnGAxIJe/mqMWdsL51LFTIXX4OdTGrKvgPYsbMsrROOwWAZvhoV
         mmHQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ABy/qLZ6fmrUPyQnIKdfEjAKWWS7GIyB6ey56UCt0Cl0sjrC6YR4vu1E
	yhMoLmF7qpdR3S1hNtc0Oa4=
X-Google-Smtp-Source: APBJJlFPlJtbG2ITvbVa6o4bbCI4dVeuIejdEnMLh3Ncw6PfHBYGTzAJJAvbEhWQjiza1SV3EPc/lg==
X-Received: by 2002:aa7:c38d:0:b0:514:9df0:e3f3 with SMTP id k13-20020aa7c38d000000b005149df0e3f3mr3972018edq.0.1689320519005;
        Fri, 14 Jul 2023 00:41:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:d891:0:b0:51d:b03f:3fda with SMTP id u17-20020aa7d891000000b0051db03f3fdals212493edq.2.-pod-prod-01-eu;
 Fri, 14 Jul 2023 00:41:56 -0700 (PDT)
X-Received: by 2002:aa7:cf0f:0:b0:51a:5e8f:ac1 with SMTP id a15-20020aa7cf0f000000b0051a5e8f0ac1mr4404913edy.23.1689320516574;
        Fri, 14 Jul 2023 00:41:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689320516; cv=none;
        d=google.com; s=arc-20160816;
        b=wAG7MiXpDAqKA2MmUbruCSodSZtP/vq7Sy0qel4siBvHigaL9KzHXDehxdxQ3cnmHg
         nuh09cwPdtakFut4FaavqXNFAmJVOWX5vDRxkVJQCD1uTqWaP1V9n+vdqAOmGzmeMV5k
         /8jmwdklLy3VEXFXAzd40yCg2re+00XjSHjPCf2q80T37a2zMNNQwCAxKghtPJqnypDH
         EY18giHwF4iQH0Pd55Y+tdxLhQkfGbM53YtMi04wHqtiFb+8pCfJJTR1gNIGuuMLDA4i
         PMp/HZ5AwUcAVNfi70wXyMIqyyyILw84hwaAN+bvn8o7ckknF+Ug9UlJThajgX/iMIyO
         kFvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Fat757SxeIFZtRvbZT2aiSru1Oe3tzbcshwgxan2nag=;
        fh=FrV6cpl4HCjWBPv4bD7daMcPSJruKZfBcVW/WO33Ffk=;
        b=ShqJRAMxUAqzg295oGC/OGWgIR73pcODT99HUeqbM2wLQMpZ7SqKolBYAqbn6RBjaW
         qhJiEXKe55bVyVuIzab4Uf8A8DKQ6MGzKxhH1qvi4BQXSMSn+rfMUqZNfRxfTjtG0/Ig
         rC2OKoAkKoAGtDNrTScgYXDwTjV7E7GE53iaekCTIasNjhnznsnjdHsV9RHqaFGVn9F0
         SBJHiCguQCKiAaqFgd4+u5HwGsdefbyeQ1DSTLqtHCPoTy55RzRBW/8aC3ReA/wqIj/L
         kjm1n21jP+gY33lczXQGPX/YkB3K99We//ge6adsmlMol4PXmYZnagofvQxRKDVIs9ML
         cmzg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=DlgAQXnv;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from b2752.mx.srv.dfn.de (b2752.mx.srv.dfn.de. [2001:638:d:c302:acdc:1979:2:f4])
        by gmr-mx.google.com with ESMTPS id z21-20020a05640240d500b0051fe05f750asi408148edb.2.2023.07.14.00.41.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 00:41:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender) client-ip=2001:638:d:c302:acdc:1979:2:f4;
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=194.95.104.12; helo=mta02.hs-regensburg.de; envelope-from=ralf.ramsauer@oth-regensburg.de; receiver=<UNKNOWN>
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de [194.95.104.12])
	by b2752.mx.srv.dfn.de (Postfix) with ESMTPS id 8241E3E00D2;
	Fri, 14 Jul 2023 09:41:55 +0200 (CEST)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4R2Nhz0z1DzyqK;
	Fri, 14 Jul 2023 09:41:55 +0200 (CEST)
Received: from [IPV6:2001:638:a01:8068:f8d9:f11a:f164:a35a]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 14 Jul
 2023 09:41:54 +0200
Message-ID: <214dd509-8fa9-82fd-425e-c1b6b9e74542@oth-regensburg.de>
Date: Fri, 14 Jul 2023 09:41:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Simplification of the hypervisor configuration for the root cell
Content-Language: en-US
To: Jan-Marc Stranz <stranzjanmarc@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <d33e6a84-7a1d-4a28-85b0-62165fd20b56n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <d33e6a84-7a1d-4a28-85b0-62165fd20b56n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=DlgAQXnv;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender)
 smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=oth-regensburg.de
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

On 13/07/2023 16:42, Jan-Marc Stranz wrote:
> Is there a way and the corresponding rules to simplify the hypervisor 
> configuration for the root cell?
> 
> I have a hypervisor configuration for the root cell with 99 entries for 
> "MemRegion".
> I am now trying to merge these regions together.
> 
> My idea is to free all areas - except the areas for the hypervisor, for 
> ivshmem and the guest cells.
> However, this fails: when starting the hypervisor, the whole system 
> "freezes".

freezes in terms of no responsiveness without a crash?

Are you sure that you did not make any mistakes while merging the 
regions? Did you decrease the number of memory regions in the 
declaration? Does jailhouse-config-check yell?

   Ralf

> 
> Then I tried to group only some areas with the same values for the 
> ".flags" element.
> This is only partially successful and I can't really see a rule when 
> areas can be grouped together or not.
> 
> How could we simplify the configuration for a root cell?
> 
> For our application we don't need the fine grained sharing of memory 
> areas (security aspect).
> Couldn't we share the whole address range for the root cell - except the 
> ranges for the hypervisor, for ivshmem and the guest cells?
> 
> Jan-Marc.
> 
> 
> -- 
> You received this message because you are subscribed to the Google 
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send 
> an email to jailhouse-dev+unsubscribe@googlegroups.com 
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit 
> https://groups.google.com/d/msgid/jailhouse-dev/d33e6a84-7a1d-4a28-85b0-62165fd20b56n%40googlegroups.com <https://groups.google.com/d/msgid/jailhouse-dev/d33e6a84-7a1d-4a28-85b0-62165fd20b56n%40googlegroups.com?utm_medium=email&utm_source=footer>.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/214dd509-8fa9-82fd-425e-c1b6b9e74542%40oth-regensburg.de.
