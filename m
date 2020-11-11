Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBINBV36QKGQEDFMTR3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2312AE999
	for <lists+jailhouse-dev@lfdr.de>; Wed, 11 Nov 2020 08:20:02 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id v5sf294671wrr.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Nov 2020 23:20:02 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1605079202; cv=pass;
        d=google.com; s=arc-20160816;
        b=CDe2ej83qr3rQ8M2ws9zbfYN0NBUJtjX36NxTWnX3tPPs8H0h9b/9PH8y9Trr3+g2c
         SaRxD66GwvqHI9jHIL8PRzii+V7RYkysnAYgDYFr91NWYBTlvEaqlrIk1WL8hvdylzH0
         FF48ytzHZ362AFvH2uS698Kw8Z/cezPMo1lpgxGqdpDA+CVTRiFN2wEd6Ky4hAH5gARh
         J++/6H4LmWe/9xukr9TLQh6vk5XfyRxwCKVEERE071F7AB+3BLWozSEONdTy6DW9SO6A
         g7yYw48TsKEVULhxfWN7BWRsXbvDzsLPEfu2gluu2vqSYba8pnk/PC/lSV9Jmm361kZX
         7nVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=Aau6QObYo3MwYFqvaXtGJEVyyxpdpT98HSNscAkobVU=;
        b=iGr1cxnT9wRnLoLr6V0jiE1aEvsfdzdZLqOynEPpGzlvuNSaVbSqbMA130GUxKScs6
         LazMDkfPNy3R0oVlusv5YjqxLl+hFA6zGCtrOm7rV+D1cwvOdsL4Gm4/uV0iw6CV1whA
         cRW9fRVweV42Ro6YG0L8iMe9mL+rDi24XXNzgSFhUTgKUH/k11sOhMh+6NObhzgS0aZ2
         zbdoTUGpNvfZ3uVR7QuPmzjLmXOn3sHRGPrtCohRNfSIvVIgG7+zXRJ9t6Dgkv4mTind
         QThiATLVs1Br3JPze91B5kU7hmFxvZYYvA/1fGwKdhocoar010vQdMwlygQqZBl1NAOL
         TIDQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Aau6QObYo3MwYFqvaXtGJEVyyxpdpT98HSNscAkobVU=;
        b=mqFOpZ8vGruGC+ax+Drb8OFCWgiC3HlMeqpaybUyRjHZ5W1UECq2WU31r4CVLin91m
         sglBl0Tm/NqHPKAPt55ISiEk6RXcLVT3QdXVKVpsUtTYRZhLnKD+NmKpXIIYdzOeNmCi
         /AD5ZBjTbxRLm21O8dcLdlOVSVebowKvl7mnlFkMGQ7LYxFZNYvVEYRMkOLU4k2fzK5S
         45xv3JCJ9p3JUfug1QbRGWH3Px/PWYRERB/vUxsHXmXdW/28S+3MSS3bc2rFGcd4pStj
         bArCWgaE34RICT//VDe7vORcxqPuBerj8eftYLup5nl5NpUX70J2rnQ3ENB2v89Yaxuc
         hTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Aau6QObYo3MwYFqvaXtGJEVyyxpdpT98HSNscAkobVU=;
        b=UeV85K0oQAa6zoly4ZWzXWuH14uYceHzaH/OnaAHBKlbILSHp6nGuLezJ6tx8h0ktw
         u79xDST0ulsw9sKL7XFb0w63tq5vdgV0zDlfy9Tt8tWo8If6L76LcjFanBW66hBzOB/j
         9vYgtrwHxFM88CFQ3NsFaurSjCdIq7fZtAFvVPJJtAL2n1g3ZNXYJbO+/fMKqnSVRAq4
         v5Iq3Fosur8+bAV3hIl+9jfHY6L7U+kUK5UMiKOvB2rqLuGVBUwJbwEkeAm7m06jTG0N
         ALgG860oCO15U5G+0E/UWBeROtkon5ow92FADiiei3fP8JWIU92hloDY6s0RUbwWFEli
         eJrw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530kLmUrCCBdxiV85Ja3CZJdTufasOIkQawM2XnxkPmPgigV2HOn
	YOFr4MUVx0MuoK1DBs2UEfY=
X-Google-Smtp-Source: ABdhPJzNYtGEnYn3imdBxuoy116CKLzPg5VSb7yXbaiqLSwonXJtA11/TVf2zchvV5ztdpbRlOhx1A==
X-Received: by 2002:adf:f7c7:: with SMTP id a7mr9164323wrq.347.1605079202492;
        Tue, 10 Nov 2020 23:20:02 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:c689:: with SMTP id j9ls1527081wrg.0.gmail; Tue, 10 Nov
 2020 23:20:01 -0800 (PST)
X-Received: by 2002:adf:ea50:: with SMTP id j16mr22760606wrn.283.1605079201192;
        Tue, 10 Nov 2020 23:20:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605079201; cv=none;
        d=google.com; s=arc-20160816;
        b=L0Z/aZ1AIb0I9RZOeSOp5Vk0lZZnYJWODfks8np+Fd78xDMbksTI4kzUhO7lC1Blj0
         +xV7EUCTWQtuPp2w6ijmdeZCzQmAzLPDMnm0cofkdDZEAg2iGXQMCtRAKlqUjDEO8XLE
         nMgQWrw4MmuLYRoskcLM5VEYCaqfArQKycjOem0BMBvALBhoNrK8PlOGnNISBfxsxWOO
         RLygGraJsOIEtGM8yPUqzKsYTnYz1YRuYuSl1AprKXcE3GEtrQDMgv7GB/DLm2ocK757
         K4CIoMX8gudngyrKqsrN4l3slvEWGf549blGgk7wMDHQdom2eP1rguPqfolE9p3L1F56
         velg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=iKu7By3W2hhA9dFfEydTq/6ddbEp9yenll9WlUXw4c8=;
        b=MkrDXSUq9Yf/IwXnWN+UgquUz6Wq/a+hWtJ9BQxpZaZHS8X30fBzUvvLSOe//1XMUf
         RsXlABEdxhu8g3Wqu/wzuWlfwj+CQbg7fjKZEUvitiGXMJyp52uiTRHrn+oIn6aUOGLL
         mtVMvokF2fQ4WzsIuFl0F/GcCMIubLJ6SGD5xu5U0x6C1w8So9bTeyIPpapWOc4DC2uw
         /MvYLy2JhYeew4MW64aJzaNXad52zj/6SjPpvQlzUDtbINwMDaLkN31Q+zp3YtqWsdx/
         w3FO76U7DkxZgk4EOveycwxtVtY0q0ajn5FWTfzrM3Wrt6a2aDBORazDV3uMtMhKgvy2
         AJ3A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id t9si155120wmt.4.2020.11.10.23.20.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2020 23:20:01 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0AB7JxbF015176
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Nov 2020 08:19:59 +0100
Received: from [167.87.33.169] ([167.87.33.169])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0AB7JxiU011791;
	Wed, 11 Nov 2020 08:19:59 +0100
Subject: Re: Jailhouse support on Arrow SoCKit Evaluation Board
To: Kai-Feng Chou <mapleelpam@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <345ef7c0-f01c-4032-811d-dbd1318da92a@googlegroups.com>
 <69a501bc-e164-8ee2-f1a0-dac5f896401e@web.de>
 <7a9814a6-dd4b-453a-977b-3e2f86119176n@googlegroups.com>
 <7253133c-e79b-4ae7-93bb-7d58e76ed1cdn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <38b5b700-e09d-6f36-1dda-2310b5465771@siemens.com>
Date: Wed, 11 Nov 2020 08:19:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <7253133c-e79b-4ae7-93bb-7d58e76ed1cdn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 10.11.20 20:29, Kai-Feng Chou wrote:
> Hi,=C2=A0
> =C2=A0I'm continuing the work and refine my cell description (not perfect=
 but
> trying ). pls see the attached.
>=20
> But it still cause panic and I notice it happend in
> jailhouse/driver/main.c:492 -
> "
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(hypervisor_mem, hyperviso=
r->data, hypervisor->size);
> "
>=20
> checked my setting -=C2=A0=C2=A0
> "=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hypervisor_memo=
ry =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 .phys_start =3D 0x800000000,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 .size =3D=C2=A0 =C2=A0 =C2=A0 =C2=A00x000400000,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
> "
>=20
> Is it the problem? my physical ddr is 4g add linux cmd_line "mem=3D1024M"=
.
>=20
> Sorry I can't find the guidance/ document for it.=C2=A0
> Any advice is welcome.
> =C2=A0

Could you also share your /proc/iomem, before and after applying
"mem=3D1024M"?

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
jailhouse-dev/38b5b700-e09d-6f36-1dda-2310b5465771%40siemens.com.
