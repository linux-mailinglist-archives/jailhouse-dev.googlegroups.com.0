Return-Path: <jailhouse-dev+bncBCP4ZTXNRIFBBG6O5XWAKGQEF4V77JI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id B492BCE91F
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 18:26:03 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id w10sf7797481wrl.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 09:26:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570465563; cv=pass;
        d=google.com; s=arc-20160816;
        b=qKe/55KKjLE8ObtFrgDpN4eFaQjuAlqNX9GAUMP5rSyzomtNvF8+56rRi2S7kmwtj0
         sAT0JYdBWukL/CiSGpC1odPx9SKQBHIlzTlabQXTIGK9ExpR89JfwfWbGk5R/Jov4Eaj
         SgRS4nrq2kmNcNHxjcRjIda+i58fJuM9uEg3+OCtxduSWXlgJl91wTzvstjjO8swlw7G
         DXsMgH5bZ+tJyeaZBCMioyGhEHhsitpiVyrzoXEszh5nozBXHzOsCcCa5AFm/D3HC1Ww
         R84YrdH2KUiDKdQjMj0Wd9O1012RmWCl2vr5J2LwJSLOwngFoezaV43S2cnZ31dj3t+G
         YJyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:sender:dkim-signature;
        bh=du+Od8mnrZpKm2TYLhVw9mdoviMrwwKfZuD6SHOxtgE=;
        b=j/yfxZ4+g2gABAgzFXlRs5XtnP606xIov2j1r4T9PS89rrXht05qOClTacEV3LHe5x
         Dw91VWHhhPGZp9Y7w8+AbZdSNMGksB+bqI2hxbhBdenm1Q3K1BVTqJQU3xxnrqfTrQQh
         7YaSduydtyDfU67O+QSBo0m/s0ckOCYNTFSsVs7Oh3MP5icfuVn+uYvb2RQv4njvrYOM
         kmHAEUt99NXoh0Z739UQD2kLlWn+akXdusx5IIyJbbfkTGsRi/u99VmpZNl9FgXkD9pT
         jP2xdGAWq5F5vlzy2Pz4tliiFTPYHaP/Ug8zGkV351pTTatRKMo/wrrg3VoZv4aTF/GR
         jQaQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@alien8.de header.s=dkim header.b=NdJbYHTK;
       spf=pass (google.com: domain of bp@alien8.de designates 2a01:4f8:190:11c2::b:1457 as permitted sender) smtp.mailfrom=bp@alien8.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=du+Od8mnrZpKm2TYLhVw9mdoviMrwwKfZuD6SHOxtgE=;
        b=SBW/WdNCNbqmWsOAYOFuSAuVmub+1XwrGUmBhbTyqC6HncRW0MkHMc7gztoKu7Blnh
         vsP0opBxLs6qFLN9hJY9ByYFTcAlO3SIXOQhXwOBCJIhHLq2wYPahF3U8Q1crlJHOirl
         WECxC8+CJqKDlEJeA+4NgYufRzC8nCQIBp/6vfor/5e7TXfSWcRm5o+NPzl4nqBqdHIB
         qORc9nebvPy6DM8IgTeTjL4KeZo9NmoOsZtAbf6muI74I3a5XeaPHawZSnUZAX/tpiP9
         KnlmrBxJTxiokl5Cc7Bv6iawcjMHHXmWDWj/cWTtHHmPt7qS24LarfWQ5oZZ8Ov1saKd
         /fEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=du+Od8mnrZpKm2TYLhVw9mdoviMrwwKfZuD6SHOxtgE=;
        b=sgUocVXUwhFmvVjKCrrn0GLvRGo5KJ3oVgCnpVoVba+ghJCtcEjsPHSa2UuA2V62wq
         MOHM80RgDJnGPxpsgRyUSKL2sujZ1voQ4FwymeEmNm1qYvK0lMZTe3kS7EWbVCvRp/wU
         8F6G5YOj5mWwzWPT0c9iKUFEaY28WR8kdonXjsXz9euTtk38w+tT74W0kO1hC/odpvpp
         Nb/sMDVSrPhWuVH+LEZuW+Nfk/H1i5X7bDljzAw+G/j2R43ZPr6o5Imw7A5yJmhnal9X
         6gn1/WsTI3ClBjvmzXbc8VradCy+yN5IZs+zB0NqqdqEFGaa65/XfObL2G/W6+P6PHq9
         i2Xw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWQ/+CAMpqeiNYHCrovEPYppDg4mN6XP97x0s1gfo424Wy9c7Pn
	7lCMa05XplottzMd+fBTFvA=
X-Google-Smtp-Source: APXvYqyP05GB/ElL9st2k2VnZq/OVXlDVAj/kSdBSybFYQDe/xJnzKBfEESbgp0X7ZAaon2F7zi6QQ==
X-Received: by 2002:adf:fa90:: with SMTP id h16mr22390203wrr.52.1570465563418;
        Mon, 07 Oct 2019 09:26:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4c42:: with SMTP id n2ls85372wrt.8.gmail; Mon, 07 Oct
 2019 09:26:02 -0700 (PDT)
X-Received: by 2002:a5d:440d:: with SMTP id z13mr5755103wrq.176.1570465562831;
        Mon, 07 Oct 2019 09:26:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570465562; cv=none;
        d=google.com; s=arc-20160816;
        b=VNuRhz/3q02+ZDfJ3Oxp/xlm1Nhi+nxSFAeopzqAMKBVa3cM/07I2ei9l+u/jM2c7v
         Xm5UmJK1YfqSY5zrOngwJtcdWFgyxkaZ/zYXldHBrA9sUW/4NkBk9uQ9qOLZnR6vdpgC
         kbK8HaedPbbODwIpxnM0V7K23R+asyHraZMAr4krvq6Gbu8I70fII/fJeRB3wYH/+A1/
         QkW+g1vw+v4x374Jr4Ai+o8C++D3UH2DWZN+2WWTsV+XGOBuUj4mFbY6KzQwjFlmMo2e
         WDItZT0vxynhpF1bonXyLpJnmxpLu+Jm8YUUXPwmP0QWHhKRdg5G3U+Vs/YKJHRXmXSC
         P0oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=PMlIdZe0tafGlH4Uo3oE7bPvqYHG4BVme2hKO40zQS4=;
        b=H2C0wqm+Q+Y9VYW28trNN9vICPj8ymCuTQ7IcDVDfMvfp7MSjDb7NNwzK0+ideSYUY
         Q2cWww3gBR+PeoH/CHUZFzlUQD1ojBoPZbLsjeYDVO7qljZCFFbBdg8q5gKgbe44oQRX
         T7bzg2jm2uxDjkWDikUO08cIi3r5TstoKBSs6eAnC61llvJ2XtysZFb2ymNv1k9pvCOr
         C5Og0ckIiH5KhUuz28Z9gryT/bZsna8MOfsQxbb0AYy5cPjC3zexPfESa6N7t1e3ndQA
         WCC1V6lf/QjyS4K8fDnbfX5vFIoUlizyHsV1MuVdbZE7S/zAqZ5IilcxBWCjWzEWVimu
         TClw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@alien8.de header.s=dkim header.b=NdJbYHTK;
       spf=pass (google.com: domain of bp@alien8.de designates 2a01:4f8:190:11c2::b:1457 as permitted sender) smtp.mailfrom=bp@alien8.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=alien8.de
Received: from mail.skyhub.de (mail.skyhub.de. [2a01:4f8:190:11c2::b:1457])
        by gmr-mx.google.com with ESMTPS id q185si5762wme.1.2019.10.07.09.26.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 09:26:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of bp@alien8.de designates 2a01:4f8:190:11c2::b:1457 as permitted sender) client-ip=2a01:4f8:190:11c2::b:1457;
Received: from zn.tnic (p200300EC2F06420085D86D94306C6599.dip0.t-ipconnect.de [IPv6:2003:ec:2f06:4200:85d8:6d94:306c:6599])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2D3E91EC0BEA;
	Mon,  7 Oct 2019 18:25:58 +0200 (CEST)
Date: Mon, 7 Oct 2019 18:25:51 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, x86@kernel.org,
	jailhouse-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v5 1/2] x86/jailhouse: improve setup data version
 comparison
Message-ID: <20191007162551.GC24289@zn.tnic>
References: <20191007123819.161432-1-ralf.ramsauer@oth-regensburg.de>
 <20191007123819.161432-2-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20191007123819.161432-2-ralf.ramsauer@oth-regensburg.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Original-Sender: bp@alien8.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@alien8.de header.s=dkim header.b=NdJbYHTK;       spf=pass
 (google.com: domain of bp@alien8.de designates 2a01:4f8:190:11c2::b:1457 as
 permitted sender) smtp.mailfrom=bp@alien8.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=alien8.de
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

On Mon, Oct 07, 2019 at 02:38:18PM +0200, Ralf Ramsauer wrote:
> We will soon introduce a new setup_data version and extend the

Who is "We"?

There a couple more "we" below. Can you please rewrite that commit message in
passive voice and thus dispense my confusion about who's "we"? :)

> structure. This requires some preparational work for the sanity check of
> the header and the check of the version.
> 
> Use the following strategy:
> 
> 1. Ensure that the header declares at least enough space for the version
>    and the compatible_version as we must hold that fields for any
>    version. Furthermore, the location and semantics of those fields will
>    never change.
> 
> 2. Copy over data -- as much as we can. The length is either limited by
>    the header length, or the length of setup_data.
> 
> 3. Things are now in place -- sanity check if the header length complies
>    the actual version.
> 
> For future versions of the setup_data, only step 3 requires alignment.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> Reviewed-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  arch/x86/include/uapi/asm/bootparam.h | 22 +++++++-----
>  arch/x86/kernel/jailhouse.c           | 50 +++++++++++++++++----------
>  2 files changed, 44 insertions(+), 28 deletions(-)

...

> @@ -180,13 +175,26 @@ static void __init jailhouse_init_platform(void)
>  	if (!pa_data)
>  		panic("Jailhouse: No valid setup data found");
>  
> -	if (setup_data.compatible_version > JAILHOUSE_SETUP_REQUIRED_VERSION)
> -		panic("Jailhouse: Unsupported setup data structure");
> +	/* setup data must at least contain the header */
> +	if (header.len < sizeof(setup_data.hdr))
> +		goto unsupported;
>  
> -	pmtmr_ioport = setup_data.pm_timer_address;
> +	pa_data += offsetof(struct setup_data, data);
> +	setup_data_len = min(sizeof(setup_data), (unsigned long)header.len);

Checkpatch makes sense here:

WARNING: min() should probably be min_t(unsigned long, sizeof(setup_data), header.len)
#165: FILE: arch/x86/kernel/jailhouse.c:183:
+       setup_data_len = min(sizeof(setup_data), (unsigned long)header.len);

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191007162551.GC24289%40zn.tnic.
