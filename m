Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBVGY5KBQMGQEV2W3QBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id B433A362EE9
	for <lists+jailhouse-dev@lfdr.de>; Sat, 17 Apr 2021 11:37:24 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id s7-20020adfc5470000b0290106eef17cbdsf2406781wrf.11
        for <lists+jailhouse-dev@lfdr.de>; Sat, 17 Apr 2021 02:37:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618652244; cv=pass;
        d=google.com; s=arc-20160816;
        b=okPiwz8WVrveK6fHDiGckfJzthog7rrSgT1OeOj0zJgnKuBmm4NltXSKHKtoZyVDQK
         cjY6ibKg8sHocvOxzpj7z5TQ8Z4GLJfScp7U6eQSD6SZ/gb9LSfb3ELBp2rW+w5dWyuX
         ZouP1vLrAz23yrYmJsHrn8caVBjxB7nvKSqA5TsCTs2LgrdjgLT15NuaH21ZsEzwCj3v
         R88i90GIRJqtNrvD/P8ZSTnnfVPevqA84zJlWzY2zQO7rB8PCbPCRcptjdJuYpe27aR+
         h0lr4PGgpb+o7mLt/mEGrIShfNvo7nXV9PV8o63hVyYLZeyO0kaRqU+8zZfOTtGBBxnT
         efGw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=8kWfEjaCCS3ITSu1oMl/h5oHIWZheeBSoX8BasGwV/U=;
        b=0X6Ygw2G2nUbf5Qk0XQaQDU/5jDKVUmaxfB4CsntRa+b5WlCU77UHZpu/6s9tEYlaF
         gj8oCll3XFA7r/2A2VQikRXfUsKdgOWRdB76RW3FhHiJuwoL1ameqGsvRpiqG5t+xbDJ
         Kb1mzqHGhEv597Zf3jLd0gCrezIFC86lFayC4jfsHwVzhVqQ2p3dltXjTzASwZZP3L9d
         rbezoMpzVSkwIXLDY6sTZtBUveNFqVTqds1AvcGOSc00S8Rglvfr3TjDbTA7idLeT0u2
         lLX8qm8ElFEHW5BTFiDu7t4lhyyQvXDZ4yw6XsFhDyKSC/rLaYhdnmaidPdMUkkYxC1B
         dV8Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=KHUY7YzH;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=8kWfEjaCCS3ITSu1oMl/h5oHIWZheeBSoX8BasGwV/U=;
        b=FEMTrgzzB9eXihCW2vejsmlngHdaC7vYdMz5OylvAxjeoVcPuMX28o0GxlrxDu4f7M
         I1F1rGFyjdt3jxUE9eIsjpa9J02r4+06GOHNXF2WRDcvXYheCdWUSnqci67GVoe4NJH3
         W+ESUxrkgk6xu2bwL8eFfowO0BQcETxCmuRi56JVozd6K2tO6b749xEHjUvcjudQqJ5r
         HpJRxtqTIet+Zh/gP0dWjqC2ZpQ/2voCJbIX4yegV3AOINLQXixrPflTTBk0Nu/EjB8d
         s1gMvsWqYu/EDYbCsjBELyY5O59/jI0afgwDzUVhthX3d//BKG6opfuYol7g0mw1w7+N
         B48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=8kWfEjaCCS3ITSu1oMl/h5oHIWZheeBSoX8BasGwV/U=;
        b=pXXuX3dplpBOcCstk639qcGy9+nH6Izo526PKVK/5M26VjV7B7dBwLtgNR5KDI/Gog
         W6z31eCRN4l2/N/ucTgUG+PJSEVQngKPekTjPRBzdnc1CH9R0hjN8IRVhZAC/VsCO6RQ
         WoIT+EDaWEiWwvfHe4R3JfQ/nZZRNPt7IhzCmoUdLnxAfclRpBuqqpPuK78ddBMqzttK
         YotONLtI/YNIdvvEIwq1dt4B/8LjDBl7L2P47bqMHgfFDbBOH9lXnvzbF3pY8Dg0siEq
         Au+OPvJBLhFdNMQPe2n13ufScKPnzQyE0/C01KxbIGt4BBRMaW73oaX4Q8Lh+g3zfOE+
         LLaw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531IDWDEPB+UqnhZXlvXUBThBBa4TIh1WjpepTgjIEyVmHsJjfUK
	GNUN8CcDFdOYe5foy87Rd3U=
X-Google-Smtp-Source: ABdhPJx69eC9bup1P4z6SZ0TIqDLY1qfNdvTUE8ZqeOTtrHlmbsw1zwXE6JLJu8jslVhhoKV3BDtxw==
X-Received: by 2002:adf:f410:: with SMTP id g16mr3536017wro.345.1618652244480;
        Sat, 17 Apr 2021 02:37:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c1c3:: with SMTP id a3ls5502105wmj.0.gmail; Sat, 17 Apr
 2021 02:37:23 -0700 (PDT)
X-Received: by 2002:a1c:771a:: with SMTP id t26mr12005448wmi.96.1618652243634;
        Sat, 17 Apr 2021 02:37:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618652243; cv=none;
        d=google.com; s=arc-20160816;
        b=FKQBbDRBPBLUlKwNMbeP4mWwzeC7ExOlX7tca7fncwtsaJRotIujuFyFhj1VqNKiqy
         kHosEFVimu4MBmKwyVnQolBFFRAmD4oBq7d/LHqeJGGk+zGKle7xwg/2VyOjUUwvA5jH
         X4Tm7rqYupdbsEvuiAJPhS3NP7yNWeQH+Ln3SgNNlawoQCg2FokEJPKKTgismKKmZ/4b
         TMRoyWD0zi+aDETe4tE1saQsBKVoWZWJBRccTCm52EKjfKYN+wPelvFDioRxVO8aCj19
         EulH7oGA1gsLVe1Bpas3DOrWBgkdCLSMd6afup61D3XWdkXKjjYzOX0IXFa/A/xsSBP/
         Fytg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=G9o97CA5MiP0DgokI2/tiQFCEMycIWmBnmK3GhRtME8=;
        b=XgcCCjlptqONDkYZmhRJX0BXwZ3ib52LWLMsENeb1fEbeE8QarN3BOkcWiYiaFet3+
         NcIW50MfTaXwWk7zq2tIjOEdyehBYNs9kwWOG6emPIu547JG1zguni72kzGDmItgd/JV
         35c8KdYlV5vRETvJ+oj5yQwCQRxtcKPiEF+Xncnsxf7e6oEoMN0QeWvC1UBT94QIpYIR
         ZzVC4WAvHG/u7/fgDMtyFZUxfQaAz4t4Gwg7Z6pXCfZabX4+m/Jmdng79SGIlf1pgnnO
         NxXQopPJSwIerIrLHxooOneesXfNdGAffdA1uegY9FJg7ess0RSn6H/UtH4oCcXxhHl3
         +ozQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=KHUY7YzH;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id w2si605993wmb.4.2021.04.17.02.37.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 02:37:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.53]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LtFYd-1lduoa0at9-012nUh; Sat, 17
 Apr 2021 11:37:23 +0200
Subject: Re: [PATCH] core: avoid overflow in paging_destroy
To: Chase Conklin <chase.conklin@arm.com>, jailhouse-dev@googlegroups.com
References: <20210330120632.23496-1-chase.conklin@arm.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <4b848060-fae4-0f46-8d47-34a55cff16a7@web.de>
Date: Sat, 17 Apr 2021 11:37:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210330120632.23496-1-chase.conklin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:0vmXpTDPf5mTDXsNIrHP6PpiIhwzntuKrUg13NHU5rz5/vwRbSa
 Dla5sRdxBdBd9/Qli5sJu4strbN7WhrXJYGJU7al+jA5KYWRfCPl6EQ6mZvLhT47vUgMhnh
 iCqwTUPzw7PgGF9roesk7rHNKvpHgACAJ9+ZawpYbdbqGdzZ4P4Sypb/T4sS334h5bm/FAr
 VQx8kC30wE3JmO3fsEpng==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ACYkIRaqqIY=:dsiRuUu1sidVAW1yzp8f/a
 IC8BFeouMqXwjvnltJPkggQ/cRt2dK+0Qd7Y2RTUc0w8TUoAPxC9e87mlC2AiZkBNZDVMUve2
 lzBR2ow5aG34oJh/x5O3b8n2ngMkuTG7VzHesdQrWgPjUDgPAbLsGkfHeuxsRHRv4/JmX1G2P
 XZ48KjCDwrZB92JGxqFDEyNxT0HvGdWvR8pRjbC5KOIBh0IwSW5gVh1yWyU3dcS+wH/6z+2Dt
 Ih0oIQmiybXEc4HyGzE3C5jj6LEJssR5bKX0fhXyWJwm7szAPkxyyqAA+cwYIJjay30NBbjih
 Ql7WKeunAT7coVqzSJQ+2nnuLt5PLzVHTP5BhctJJMnz1KPf9X6bFUhEPxpctQzKop3tWLB4s
 HSgEIL8eR1J6WK7HsSgeMth/wTN4Letgql+uuP3GrDZqy4fWT1+3kKixidys530J8aG0UGhGT
 E9bh6DPS8guKIDCMcl3wRtQksn1zDJcTiIRH5STd9j7zNJwfTYKta61bYFJjBst0mylgnRLqp
 kend7gXOV0Fi8gAaZU+R/lR1e4ldFHJeQlnjI3YIfLEbPL3Z7acEY8KgqABVvn4rlWle6H2tf
 EHfuqNX7MxsCTN6bRLMgkaGQ3WgzxSIHVv/cExnD99R39ghonIyQIXic1l7QaFiyD8zHpcI6C
 ydQGjAPm9QwIV40Aff7RpvcOx/fjRQze8akLEnDyEs1vu6S/7jxowKuKaA+ekbvZYHHMTOrSw
 GZmPZssw67M4jJOYt1nswN6AetCoDEWXc/ujtp8RFsmy9bOfMGUhSednX8n39NIa7pz0CMgDl
 EfUpp2mHN0rsJfVAh4E8yDKGpM7iXB3P+2cHX3bz8gH4GRtPmb2ZVi5u0N8Shp3xgj77IEExc
 sNkjlCDCo9oX7cO9NPRqFbqofaaiaPO87niDiYpTaaDqi+JE6BgWm55aQNf4WNU4O6fQwIDdK
 QXwyuCMzGkdIQCw7xs1AWuC5C7eJMnBRNlNYNXTVPuy8fIfwGIXtTuSwTnJUn+MBSbV+z30f1
 4LFykkz72m0nkprX2wh43PPmgLHsa97exZsDUnKE6Fshp/VenZ0oAMYzxR/8P90hs5+N53MTc
 zXpilRKiIT07yEeAM30UUuhLnSXmzH1/PCSUhjEKvf9RqZR1mwOXDilS+5XeFi1YeK3lSIVD2
 iy/gVTDuDINiCee4n7qTS/QND4MJrKu29+HvuQY3hneUz4tUbLzk48HhiEAlxXDylteqY=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=KHUY7YzH;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 30.03.21 14:06, Chase Conklin wrote:
> It is possible for the ending address in paging_destroy to overflow to
> exactly 0. For example, in a build with 32-bit addresses, a request to
> unmap 512MB at 0xe0000000 will result in an overflow (0xe0000000 +
> 0x20000000 = 0x100000000 which exceeds 32 bits).
>
> This overflow can be avoided by comparing the last address in the
> region to be unmapped rather than the first address to not be
> unmapped.
>
> Fixes: 7cffb9b7d54d ("core: fix hugepage splitting in paging_destroy")
> Signed-off-by: Chase Conklin <chase.conklin@arm.com>
> ---
>  hypervisor/paging.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/hypervisor/paging.c b/hypervisor/paging.c
> index 75d5da59..e77fac30 100644
> --- a/hypervisor/paging.c
> +++ b/hypervisor/paging.c
> @@ -399,8 +399,21 @@ int paging_destroy(const struct paging_structures *pg_structs,
>  					paging->page_size : PAGE_SIZE;
>  				page_start = virt & ~(page_size-1);
>
> +				/*
> +				 * It's possible that virt + size overflows to
> +				 * exactly 0 (e.g. a 512MB region starting at
> +				 * 0xe0000000 with 32-bit addresses) during
> +				 * normal execution. Any overflow beyond that is
> +				 * a programming error.
> +				 *
> +				 * To handle this case, subtract 1 from the size
> +				 * when comparing both sides. Note that
> +				 * page_size is always > 0, so there's no risk
> +				 * of underflow.
> +				 */
>  				if (virt <= page_start &&
> -				    virt + size >= page_start + page_size)
> +				    virt + (size - 1) >=
> +				    page_start + (page_size - 1))
>  					break;
>
>  				err = split_hugepage(pg_structs->hv_paging,
>

Good catch!. Applied - with a minor comment tweak:

"Note that size and page_size are always > 0..."

Thanks,
Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4b848060-fae4-0f46-8d47-34a55cff16a7%40web.de.
