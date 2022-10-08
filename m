Return-Path: <jailhouse-dev+bncBCP4ZTXNRIFBBY5GQ2NAMGQEF65NSTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A915F85C3
	for <lists+jailhouse-dev@lfdr.de>; Sat,  8 Oct 2022 17:12:37 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id h129-20020a1c2187000000b003bf635eac31sf1294461wmh.4
        for <lists+jailhouse-dev@lfdr.de>; Sat, 08 Oct 2022 08:12:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1665241957; cv=pass;
        d=google.com; s=arc-20160816;
        b=bI/U4FjHmjpvLm3H0UGkA4383Ma3oCVvTCE+iyU1EL+8GZcgDwYFuJl7RVcD0MS0PQ
         IUvzzWCYMPRXIbRgQXwAgijogzvawpG2cxGbKkjq2/VRSmHLbeCtsrEcuUXnIq7Frmz6
         QvpkLC3S/31Y7pMn2v+Ta0LgqM3xJGg76DInwYgRceVNTSg+J6d2uMA+e1fPTOnMksCV
         DgBrWEfGukTkO5HYWCr3goBCIJ0ieVB68oGr2mDZSmSSkR2t53g/OOj8PBRzSxwrSSPR
         1LIjGIoHYSVuBYHoAAiDkLX3iCQosozYIJ9nOcTB0lZ4OVuhiRTTJkCSqaWu74UBZy2X
         5eMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :dkim-signature;
        bh=p6Lztq1RPelJMQuaR+hz2jCw0B7L+d9IQGaWunjkrEU=;
        b=KrNN03GL5QCjeqkuDYd+auYXWxzVZNKLoODBwXWQl6OP9F62E6TVjq0GCFF1tUYXMA
         DFYe1uTo/wC+yvD0MGju1Rn6D8qrMKOZfQX7oz79TE56pYXdhzVMAUtcquGTw9O7N1Fp
         ECWHxDNvTMY0fDTx0ZmTg6ZD1vsCJKX8Q6CeRdLvCBgk7NXJC7YBzsJAYE1zCq/hzsyf
         jow0trb+DqkiReeriHpbPR779JCw2lkkICnI56X6nM/9ylIsnRNQ7wTwOjTK5xkS2ov3
         YHyjhulhxciVXHiysNPlLfKY+ijKzaFLB/nA8FyNc/myUt4OA+FqcQFs41YpAdzpQXLU
         NWrA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@alien8.de header.s=dkim header.b="NkOfR/aW";
       spf=pass (google.com: domain of bp@alien8.de designates 2a01:4f8:190:11c2::b:1457 as permitted sender) smtp.mailfrom=bp@alien8.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6Lztq1RPelJMQuaR+hz2jCw0B7L+d9IQGaWunjkrEU=;
        b=ZqXswjlxnAgNVJf5A8Vx4iymsJZ2h2kid77cCtve6NafVJlwWFJ+KKc1HJnCIGZpEa
         kFGshs/+E0oztOzNv68Gfh356RDpx5ncwqEy5qLRATvomzP/Ja7eWPpSBu9BPl1FFHMI
         EimyiqgMHDYMBEaRE10rmmrAvAEQGv5lxgecvby2hqqAaszmhItCQciEHAnHwCDl99xI
         wXmZAlxWj5YQ7siH7Yw/TA8tmlXG7MiQ64rZAOJBbMFZJaKbLIShzDHW4idctGdjGQ84
         tzhQEFRUdUCeENz8DPm240E5a50lc88hd/WLadbLcmoMrxgnd3pMHZyXMrPUuM0rEI6X
         mAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6Lztq1RPelJMQuaR+hz2jCw0B7L+d9IQGaWunjkrEU=;
        b=v/z1V3ysvMrOa7qcGVihmZ3rtXeTNnItDbQfq0dRu3/aU5odpQhreufsgMGdVM03M0
         4wcLpHdCw/gTSwMz1dlsDj5u+JKH05sQ+S2PDlaXqOWeMh40rNuS/giNJtroueM3LcOv
         YKr+Nub9RlLcdqraJpg7HT5tZKkfL3UqV2lDAP4YlEsr3M8gWSxk88hEVLqNdjH/Tsc6
         9cO6K+iGpTjlB3y5Gk2vkHrUx5qtIztqH0lD7dJJZEJGaYuQ+RYwek54rnBbLkjqgjb4
         H9MUKQ82pHnPj/h4GQbpW1G4u9xdYWtQ8tNpz0cfOu1mGa60Sto1T0ybUMftk/wo7sBT
         EASA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf0EfVXbdx2lYV+P7i3TwObol7BqicHDQAuY00XHjnUzTB7KI26o
	RMZY8nrIAqdUS0lipB5vj9A=
X-Google-Smtp-Source: AMsMyM68e6ipGx1LLlggSX00ZVF1HqENx7kYvV6oPQy6x2UM+FSyy38ndAw7n2jaPeiQ4ywdCSINHw==
X-Received: by 2002:a05:600c:4ec8:b0:3b4:bdc6:9b3d with SMTP id g8-20020a05600c4ec800b003b4bdc69b3dmr13742243wmq.181.1665241956544;
        Sat, 08 Oct 2022 08:12:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:23c:b0:22c:d34e:768c with SMTP id
 l28-20020a056000023c00b0022cd34e768cls4068758wrz.0.-pod-prod-gmail; Sat, 08
 Oct 2022 08:12:34 -0700 (PDT)
X-Received: by 2002:a5d:4351:0:b0:22e:363b:11d7 with SMTP id u17-20020a5d4351000000b0022e363b11d7mr6668358wrr.647.1665241954936;
        Sat, 08 Oct 2022 08:12:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665241954; cv=none;
        d=google.com; s=arc-20160816;
        b=It1rMDwO/TaLXWdFDlTnHBkjsk0u1cvO9qpoLHvLQORsG8ku1WTJnSmWyHMaD8cAi9
         deVZxFO87MVX+6bZCq8n6Zg/pDZpdyVjSSgeALiL0w+p/mefHBP8WplDvugzuNSFsCGS
         Ef0/StFta8Jadcw1pi2utJTLCecXZiT6uk7FYTgxTRCZV7DJlhvfDmbxRdgUyAtjG8L7
         EyNjQBRAwJ2aYmPJ6TKE4QGS0DesYTP/8fw7yRsAkIVkuom8TBCIoQrbnJtr+v+9Cycm
         svSu09nOeruvCFB0i+Qxgbo88ddtE/pSolL5a8UCQPKjCSi6vMPHf7AZUMwfujSe9UoJ
         kj3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=DYgRImUlP5sBAB0m+Fi/O5fIFHatVYNoMS9h40YOHco=;
        b=wcSAoHFkLWg8YBu6Q1Xvp7CV0qHxSO1ZaP3724d4EYo/Vg8c2eX8JZGDAez9EmKtn2
         LNHSC8B257RqlB+VxsumBBffSHITAFLvsDnU2EJzqsrSepu8iMSZqBXSpNdnAXoNpp9Y
         CTnliZZSlbRq0GsmdUfzliGUY49sA91UML2Z336ZnzhwjgGCRiTKeovMi1lY7B6FMrQg
         wq0ddDj9Fl3J2ydRM4udNo9nItNVXB+i55uH7Yd9fnh9cxWqdNkOGeuX/rr53lOQeY/f
         dXiF78OGHALPl63DwEJm37hIvHWKPEqmrlNA2iCg7iIwzdRYAVyEMdF//Bi0VJmOS/rQ
         UKfQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@alien8.de header.s=dkim header.b="NkOfR/aW";
       spf=pass (google.com: domain of bp@alien8.de designates 2a01:4f8:190:11c2::b:1457 as permitted sender) smtp.mailfrom=bp@alien8.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=alien8.de
Received: from mail.skyhub.de (mail.skyhub.de. [2a01:4f8:190:11c2::b:1457])
        by gmr-mx.google.com with ESMTPS id bt28-20020a056000081c00b0022e3df50e0bsi205567wrb.2.2022.10.08.08.12.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 Oct 2022 08:12:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of bp@alien8.de designates 2a01:4f8:190:11c2::b:1457 as permitted sender) client-ip=2a01:4f8:190:11c2::b:1457;
Received: from nazgul.tnic (unknown [46.183.103.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4DFE01EC05B0;
	Sat,  8 Oct 2022 17:12:30 +0200 (CEST)
Date: Sat, 8 Oct 2022 17:12:35 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ross Philipson <ross.philipson@oracle.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	dpsmith@apertussolutions.com, tglx@linutronix.de, mingo@redhat.com,
	hpa@zytor.com, luto@amacapital.net, dave.hansen@linux.intel.com,
	kanth.ghatraju@oracle.com, trenchboot-devel@googlegroups.com,
	Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] x86: Check return values from early_memremap calls
Message-ID: <Y0GTUg1ACpKZYMHY@nazgul.tnic>
References: <1650035401-22855-1-git-send-email-ross.philipson@oracle.com>
 <1650035401-22855-2-git-send-email-ross.philipson@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <1650035401-22855-2-git-send-email-ross.philipson@oracle.com>
X-Original-Sender: bp@alien8.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@alien8.de header.s=dkim header.b="NkOfR/aW";       spf=pass
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

Adding Xen and Jailhouse people and MLs to Cc.

Folks, thread starts here:

https://lore.kernel.org/r/1650035401-22855-1-git-send-email-ross.philipson@oracle.com

On Fri, Apr 15, 2022 at 11:10:00AM -0400, Ross Philipson wrote:
> There are a number of places where early_memremap is called
> but the return pointer is not checked for NULL. The call
> can result in a NULL being returned so the checks must
> be added.
> 
> Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
> ---
>  arch/x86/kernel/devicetree.c | 10 ++++++++++
>  arch/x86/kernel/e820.c       |  5 +++++
>  arch/x86/kernel/jailhouse.c  |  6 ++++++
>  arch/x86/kernel/mpparse.c    | 23 +++++++++++++++++++++++
>  arch/x86/kernel/setup.c      |  5 +++++
>  arch/x86/xen/enlighten_hvm.c |  2 ++
>  arch/x86/xen/mmu_pv.c        |  8 ++++++++
>  arch/x86/xen/setup.c         |  2 ++
>  8 files changed, 61 insertions(+)

Ok, a couple of notes:

1. the pr_*("<prefix>:" ... )

thing is done using pr_fmt() - grep the tree for examples.

2. I think you should not panic() the machine but issue a the
warning/error and let the machine die a painful death anyway. But Xen
folks will know better what would be the optimal thing to do.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/Y0GTUg1ACpKZYMHY%40nazgul.tnic.
