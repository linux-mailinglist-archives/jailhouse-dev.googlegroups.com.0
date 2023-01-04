Return-Path: <jailhouse-dev+bncBCP4ZTXNRIFBB7OT2WOQMGQEQ3NSKSI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 2764265D1F0
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 Jan 2023 12:58:55 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id y19-20020a05651c221300b00279958f353fsf7753487ljq.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Jan 2023 03:58:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672833534; cv=pass;
        d=google.com; s=arc-20160816;
        b=IpU/+O3/L4WsCdRoUj2xAx8JB812XsD05tb1TeR5IszT+3fteVO7hHbA86I1A4H/Iz
         j4kOpIBzlp310PmVGHs8wof0SVtGoN+KatKDpPqXIb3WkJpMLax5kzt48TLa9//C2y+B
         Z+dFVcThdBUtFVomyhtvrU65y5zpmwxCObXmc5OwdittkkBCrNPEZtUWiZNWvjpQPCur
         UgFoMMPGK9gJ7G3uu0keQ2awK9zEuyU3wUVx8pdmT0Aj+uABEHwCm+xEUIP7G/h9iRCl
         pI+E/cfj2wwaZbGi2PDgdO6kK7wJoNpa3XkN95v74Bf38zZ0xGLfVs1s7JAeyDsQjBy5
         TKWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :dkim-signature;
        bh=J7cLw2Abje17Pc0HHKGlNMXotbYxYUiAeZPmtQLj2Is=;
        b=f7+uhP6S46gcG4JTw2/nsY2CYWGqYASh9OqBb6N61g1XVvs9nkqZA9/cP4eLVb6q86
         gvAQWak4phLN5Cf6SRaNgZMZvivBuPIsFH1Bj1ueWir60RyiGRkHezMt7Jyhlz3zaecS
         nBGFkM2esvVnIjU5qvpL9SUQVGUTCEhf6ru/V/qFNc0+fA1Be2R5wvFMW/ebAfBto2Zy
         JtRjoxOzYnhMug+bt0C1m06o/CPune2jCnIxsOxqanN3id6Q1J3B88Cn8S6yIbPNqD2E
         68XfDuliRIhAvwrMuzNjUNrxzgZSPmFRDdgcoa516mT9WMEEKRAe8rSrbYA28MZlV+HB
         YLqQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@alien8.de header.s=dkim header.b=VcttLkPN;
       spf=pass (google.com: domain of bp@alien8.de designates 5.9.137.197 as permitted sender) smtp.mailfrom=bp@alien8.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J7cLw2Abje17Pc0HHKGlNMXotbYxYUiAeZPmtQLj2Is=;
        b=eI7B11Im1M5w758Ywx6aUhcyUAUg6sS2bQHBjyqQ4hMLDGGQfzytEAM9EtCI+riS1G
         dyOwAd3rFnuKAoSZzUpW3k5g9CUQ/Ug9mI+pwKUp5gdJjdTEJ7ru+4DjGqXEEj+TgYRv
         Iglx10z4cszgcGBgky6zcRZmrLxRi1tSukul6xoLHSC1g3r9+hQqzaGRHfguP611eFsA
         NKEjjXjBqyTTIOTMq6Q+o9g7q4Vs5qq+wSqIPr/QIX+Qs9GchfLRRTvTMqRM3epGaay/
         3detgUUKhd11b/UGfux+PQp1w0gwn5L8XPPz6ucaF9jX5uP2olRSSdbOpBewLTNss1UK
         5xNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7cLw2Abje17Pc0HHKGlNMXotbYxYUiAeZPmtQLj2Is=;
        b=XqnHywTeZerJJsoC4KrAmTRA3TdiJtJHiBqaWskeuZqKt/aPkdVADkZR8ipqoD9hng
         l+K3ct7dbZ7tRe1ALO9mUITQG8xy32brKHLt/zBFblchMVoBu7jWYJSfPRUwnQVSc6qJ
         XK7yGJNKModcmxHw7GdIW6rUXXlJBT/yeOhk3S+SemtR+jIZ/JgScrRyxjv/P55cMW06
         uNTywt5+RkRF8BtEb8w8p9OpukO0DZnE58+FZotMhka8WbQWna5j9I3vxJGAY1eRin8r
         tOljOoM0hKb96WotybXH50mlZFYtK/IdRqgIP0iuvsFQN3ffdZu8xHv+u0bXi0ZJ8GRh
         IUjQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kq9J3AI6NLNPPUgaEjlSgOO+xFdq6xVt9RG+nFN4dAYmBrufAjo
	A2onDVQ6hlXxE8UjtYvm+48=
X-Google-Smtp-Source: AMrXdXvBPZQyPvvt7HLE3+qMKk6OF+Q8YJonuWOh3HERutiC1XVsWv3cHrDrhWu4v90NvH0lRjgU1g==
X-Received: by 2002:a2e:be9b:0:b0:27f:af16:f094 with SMTP id a27-20020a2ebe9b000000b0027faf16f094mr2021334ljr.522.1672833534535;
        Wed, 04 Jan 2023 03:58:54 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:1182:b0:4b5:3cdf:5a65 with SMTP id
 g2-20020a056512118200b004b53cdf5a65ls26927lfr.2.-pod-prod-gmail; Wed, 04 Jan
 2023 03:58:53 -0800 (PST)
X-Received: by 2002:ac2:4f0c:0:b0:4b5:5f2e:3cc6 with SMTP id k12-20020ac24f0c000000b004b55f2e3cc6mr13371757lfr.47.1672833532957;
        Wed, 04 Jan 2023 03:58:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672833532; cv=none;
        d=google.com; s=arc-20160816;
        b=NIruKQlqc55puRiYR7mu7a4XWmBfsMvfRZ9k6z7ESwIxV99STIRPsdsdg8T2nnxZYv
         l/iOyV+xZerGE0CSsQ9Bo0czB62OOk+dipwX+47n6V3fJRhLlCZDRu1z90HrLu26evOm
         FKgY0wsoKE+24pFWQ6zwlvJp15mHegbvgGkwVeTzslZ/UyKgesR7tzRarsaDxpsAGQWK
         aSFjpLgTitSDCOK7Asw+fEsqoaVkfQJ8w8WPonx5lMOherV3ibbONBKmfZqv++ioHSkN
         eU5eOknr+2kAOlzgZQ/RuTT7D/DT3otechj9SrdHgADaQ0daYAsqAQ3yWXmEABLP2z8X
         Qjtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=UKl/CVF+4GJS0LDdyX728sU1J1aGkocy2OklfcAdRtI=;
        b=YaYnHKWcV35E4bsGyYboWmgFzHESIT9fEN2mBw2H5d4R+q9/Q7crOZ50Wd8+G1QbGX
         O0xVDCrY3Awm9eQUK1CF5PUTzqW1FqEgT5F9aOnyVVO0F/M2FfvxNJKnRXfu81LtZWx4
         WjOlXCwHLPdM4Hi1VjtfN9z2irlsWNGe1e7g9E6XI+OD/JnuLcb0A7aYcL+kF394yZuH
         LdujqHT35fKh1CJ65gt9AkW+h0fOf29y8dLv/Cg5Mm4EbEKFX0JtzXcUdWIFNoJ3O+cI
         eBDc87PWLVc8kfREhkNYdwF/kyF5cE1JrJn/jRybvgdwlNRKOHKmrzvE3ZB9EiqirTwH
         vhJw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@alien8.de header.s=dkim header.b=VcttLkPN;
       spf=pass (google.com: domain of bp@alien8.de designates 5.9.137.197 as permitted sender) smtp.mailfrom=bp@alien8.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=alien8.de
Received: from mail.skyhub.de (mail.skyhub.de. [5.9.137.197])
        by gmr-mx.google.com with ESMTPS id v27-20020a05651203bb00b004b571cef682si1177756lfp.5.2023.01.04.03.58.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Jan 2023 03:58:52 -0800 (PST)
Received-SPF: pass (google.com: domain of bp@alien8.de designates 5.9.137.197 as permitted sender) client-ip=5.9.137.197;
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 18EC91EC008F;
	Wed,  4 Jan 2023 12:58:52 +0100 (CET)
Date: Wed, 4 Jan 2023 12:58:48 +0100
From: Borislav Petkov <bp@alien8.de>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Ross Philipson <ross.philipson@oracle.com>,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	dpsmith@apertussolutions.com, tglx@linutronix.de, mingo@redhat.com,
	hpa@zytor.com, luto@amacapital.net, dave.hansen@linux.intel.com,
	kanth.ghatraju@oracle.com, trenchboot-devel@googlegroups.com,
	jailhouse-dev@googlegroups.com, jan.kiszka@siemens.com,
	xen-devel@lists.xenproject.org, jgross@suse.com,
	boris.ostrovsky@oracle.com, andrew.cooper3@citrix.com
Subject: Re: [PATCH v2 1/2] x86: Check return values from early_memremap calls
Message-ID: <Y7Vp+EPq5wkGr5mi@zn.tnic>
References: <20221110154521.613472-1-ross.philipson@oracle.com>
 <20221110154521.613472-2-ross.philipson@oracle.com>
 <8e62a029-f2fa-0627-1f71-4850a68ec6b6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <8e62a029-f2fa-0627-1f71-4850a68ec6b6@intel.com>
X-Original-Sender: bp@alien8.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@alien8.de header.s=dkim header.b=VcttLkPN;       spf=pass
 (google.com: domain of bp@alien8.de designates 5.9.137.197 as permitted
 sender) smtp.mailfrom=bp@alien8.de;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=alien8.de
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

On Thu, Nov 10, 2022 at 08:07:53AM -0800, Dave Hansen wrote:
> On 11/10/22 07:45, Ross Philipson wrote:
> >  	dt = early_memremap(initial_dtb, map_len);
> > +	if (!dt) {
> > +		pr_warn("failed to memremap initial dtb\n");
> > +		return;
> > +	}
> 
> Are all of these new pr_warn/err()'s really adding much value?  They all
> look pretty generic.  It makes me wonder if we should just spit out a
> generic message in early_memremap() and save all the callers the trouble.

Well, let's see.

early_memremap() calls __early_ioremap() and that one already warns befofe each
NULL return. So I guess we don't need the error messages as we will know where
it starts failing.

I guess we still need the error handling though.

I.e., this above should be:

    dt = early_memremap(initial_dtb, map_len);
+   if (!dt)
+           return;

so that we don't go off into the weeds with a NULL ptr.

Or?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/Y7Vp%2BEPq5wkGr5mi%40zn.tnic.
