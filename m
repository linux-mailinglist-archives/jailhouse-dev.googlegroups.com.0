Return-Path: <jailhouse-dev+bncBCP4ZTXNRIFBBCWGTONAMGQER5DUO3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F45E5FC8BE
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Oct 2022 17:53:48 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id l11-20020a2e700b000000b0026e280dcdb7sf5877312ljc.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Oct 2022 08:53:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1665590028; cv=pass;
        d=google.com; s=arc-20160816;
        b=w0Sno9qhHt3A7lW55MYa3UYEZBU4gn0ZOMbF2LeIGa6JR7pJ24/eCP8PD0JdOr8Sig
         XyUrvQu0O8Wq2YZeCWvv42BAEuagti/EOr1lcdqnjJzVQaiQD0MJUA7utjI13+u5fBNs
         52gWuGrAk5QKs5UG5cMbOIXqka1hM8w/0/wEBQcmm5QFYVxJk0dYfrYzKp8dpg8KRRrc
         uEW3vtHUnWI1ogYh1VnfxIbYmjCgJf0lOmyZduJn1e5S0FPrza/3rLk8dEqcqseNQJOQ
         +g/EhBbyaj6y2nFodOhm7zzb7kazLp9etJCRoR40MniMii4JAtLYCWRpdG/UXV8Ie72b
         AICw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=toIp9k9Lio+q7D7zMyRs9FYm+/MOFYUhSjVccoxBsqk=;
        b=Q8dQ2SX96SWLqhPfnUQaRjIAaLUtaQrWHQkciz2hsXT+WcN9MTq2t4J9gz1+xlY87c
         wGUvCxdm7RNRAW/ck6BBUx3gpPi+YeVXc8nb5xmLUunT1/msxWGfXP9Uzsx5TzSrNXqb
         aAF9cmxgVEQncPUYftij0FFAbzfmbHf0N+ckX2b4U/Fd326WcdHD3Y4F98JWDJd30aZR
         H0jfjlVaj6LQ0OeANq95UsWTFv+ceXE3cd0BFXL5SPsZo34wdfol+aPXV5hXcoXhTvIr
         0/Ea0LduRvaeSKJTolpr/Jqr+bB+bCBOO+R/8mic7/6Z46b1Cu6gk0srhXeuZJCA8Knu
         h1UA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@alien8.de header.s=dkim header.b=nYK7i3Nz;
       spf=pass (google.com: domain of bp@alien8.de designates 5.9.137.197 as permitted sender) smtp.mailfrom=bp@alien8.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=toIp9k9Lio+q7D7zMyRs9FYm+/MOFYUhSjVccoxBsqk=;
        b=ORsBdu6SowWRWQVOWN5ze3f2y1b20XuyOM2Yebj2BCbfjJ+iGZB8b8aIyXa53+O+Sz
         BjaRnb+DaO/hXFT3qTkYpY+Nz65+MHAecqhQV6/Cg1YdIJP88DlmpKw3qcnRwIia/EHD
         3BhBgF0Rm7rzMAlaO3zft2eP8/8yHLZNSVJT60kHeF/vEOwYh+pYkx0JN5IB/kwSp1/6
         ernAJlNO1HZs7H20BUd+SRMvuGNQPhYRMFu+n1cFIfUoPi/geSw72IdewGsV+MfSJGlG
         Ebtq0XoF7ThZlOXh0mt9lPlRwRd2TyNffyUfW/lrqvYsP4dPPPPELzuLjmqzDg7+3YOd
         Mwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-message-state
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=toIp9k9Lio+q7D7zMyRs9FYm+/MOFYUhSjVccoxBsqk=;
        b=fC5LerrvbV9+cM/63hwzso6TOtPnMxjSLVHDihFp6ExVb4NrJyX/caFWNp2eKITvjB
         sC4ml0tuwzaklljWJjPLA0PBP+cuGRy2atwXDXxZwsPgEaMZKTzI7EJeQWcVb6N94/OI
         TTFTo1/xc3IgeTPtffQBmqsDDgv6w0QQFwfcMvSllFa+z9ogMOey9rZZ1NsMHpOXtU1y
         ZSOUJJlMRsXstAE8JJV6zNV1bccHWM/9Prdu+4/kb3yoRNXgQfl3sttdvs4b8OcMn17L
         YGt3nt90UZnS36A7hP4JcpG9rl917lWXn6mD/N718Sn5n1Rvz6Dl0q82JknDfwJWL2/R
         Fc6Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf2A8482FsQpByB6TZJgeibkjxiPypOfFL80x87eqKxj7oDaACx9
	AoXVxi3DxaWfG5iVDJgJc/s=
X-Google-Smtp-Source: AMsMyM6acfpv+7SyUj6uw/ityTxOL5VhdC7bGCZMUS+/sOe3QWUZgLiAJEw6HKy80dXoaPVwTK/yYw==
X-Received: by 2002:a2e:bc24:0:b0:26f:a6f1:e8ca with SMTP id b36-20020a2ebc24000000b0026fa6f1e8camr6639844ljf.249.1665590027764;
        Wed, 12 Oct 2022 08:53:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9444:0:b0:26b:ff81:b7cb with SMTP id o4-20020a2e9444000000b0026bff81b7cbls3382775ljh.6.-pod-prod-gmail;
 Wed, 12 Oct 2022 08:53:46 -0700 (PDT)
X-Received: by 2002:a2e:1606:0:b0:26e:54a:ddca with SMTP id w6-20020a2e1606000000b0026e054addcamr11801619ljd.478.1665590026069;
        Wed, 12 Oct 2022 08:53:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665590026; cv=none;
        d=google.com; s=arc-20160816;
        b=mk6F0CCAzaD71cKEHgYqTQweGjlAuGzPecS0XZsJeL7AoYH8KvkSYtdLq//qcE7+zy
         BOiUXHf3c8ztzc2HMbVVU+nKFGsxXGUq0yor8IoYDvXALmKMkftV+1THiFOZ/Kkm/Nnm
         SwvdhLHp4bfbG0MY3+l7Erm13nK6/kHeoia9eFv0scpyaMI2MKJwwx1McC8MOVsNShgg
         gb5xMkKDcUjD9c3x35ORjEUVa1On1nEvx8zqKch7FHdsLUSf9f5nOjETaBB5w373MaDp
         VkKPSLouNoiDjBh4Vj0aG+y3d1BxxXl4YH9b2zAV09Lamqi/0HY71H7s7uJFNHiQ687/
         hCGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=n37CuGT72/BdjSCMX/SbC87AZ3K1N+NFaoL8bgbkin4=;
        b=dhPouK306cSZtqPjVa1zR587SY71Y0rZrvXrvCF/XYKndKPqCPKzhvXjrrtqRT0YMa
         bYq342On6DQcjtpXCv4euNkjrutg1Ec09PS7/ov2EYuFWrP5JPPIAxgIzvhbtRlqh41k
         tzDRLtjmk11OH54VSKEzXuO3FHSGfj+KhoEpwyYQSdVN+NT4Cv6tb8zb8gq/iOGPuz2E
         jxZvGvrYJGO9MtXcF20G0JnxgDxb3VCB/4wHOjLkf0HBzRYAFHAeeLU7I3/GXxIPvrSy
         NMspgBb7iFrvWqIPNPG7WFmueRMKDGcr+9V0kJfdd9q6Vd+HniLTips4oaFkQtTmD7Xb
         8OHQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@alien8.de header.s=dkim header.b=nYK7i3Nz;
       spf=pass (google.com: domain of bp@alien8.de designates 5.9.137.197 as permitted sender) smtp.mailfrom=bp@alien8.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=alien8.de
Received: from mail.skyhub.de (mail.skyhub.de. [5.9.137.197])
        by gmr-mx.google.com with ESMTPS id t12-20020a056512068c00b0048b38f379d7si435312lfe.0.2022.10.12.08.53.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Oct 2022 08:53:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of bp@alien8.de designates 5.9.137.197 as permitted sender) client-ip=5.9.137.197;
Received: from zn.tnic (p200300ea9733e705329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:9733:e705:329c:23ff:fea6:a903])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 124591EC0725;
	Wed, 12 Oct 2022 17:53:41 +0200 (CEST)
Date: Wed, 12 Oct 2022 17:53:40 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ross Philipson <ross.philipson@oracle.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	dpsmith@apertussolutions.com, tglx@linutronix.de, mingo@redhat.com,
	hpa@zytor.com, luto@amacapital.net, dave.hansen@linux.intel.com,
	kanth.ghatraju@oracle.com, trenchboot-devel@googlegroups.com,
	Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] x86: Check return values from early_memremap calls
Message-ID: <Y0bjBP6/Eyg8B25k@zn.tnic>
References: <1650035401-22855-1-git-send-email-ross.philipson@oracle.com>
 <1650035401-22855-2-git-send-email-ross.philipson@oracle.com>
 <Y0GTUg1ACpKZYMHY@nazgul.tnic>
 <201850b3-5126-cd79-637f-79f198dd409d@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <201850b3-5126-cd79-637f-79f198dd409d@oracle.com>
X-Original-Sender: bp@alien8.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@alien8.de header.s=dkim header.b=nYK7i3Nz;       spf=pass
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

On Wed, Oct 12, 2022 at 11:13:20AM -0400, Ross Philipson wrote:
> I am already using the pr_* macros in the patches. Are you asking me to d=
o
> something

Yes. You do

pr_X("prefix_string: msg"

while you should set the prefix string and do

pr_X("msg".

As said, grep the tree for examples where pr_fmt() is set.
arch/x86/kernel/cpu/bugs.c is a good example.

> When I was working on the patches I asked Andrew Cooper at Citrix what
> action I should take if any of the calls in the Xen code failed. I
> believe he told me it was basically fatal and that panic() would be
> fine there.

Yes, that should be confirmed by people who know the code and you should
mention in the commit message at least that panicking is the only viable
thing to do in the respective case. If, as J=C3=BCrgen says, it is actually
better to panic() in those cases, especially if it otherwise would make
debugging harder, then sure, by all means.

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/Y0bjBP6/Eyg8B25k%40zn.tnic.
