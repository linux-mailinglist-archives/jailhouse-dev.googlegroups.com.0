Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHUP6DXAKGQEIF3BVHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id BD75E10923C
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Nov 2019 17:55:58 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id o20sf3150090ljg.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Nov 2019 08:55:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1574700958; cv=pass;
        d=google.com; s=arc-20160816;
        b=g9/vHqKtKYR2JxXHE25MiJObeEtOBO7aSoX0x+elvH1dm+YFO8NY8Zs1pfR8KdJJ9F
         SRjN9kfc+QIQWv9DN39gXM9PLZx+SgByduF/5injqxso7f+Euu/Ur7C/564uWB9Ip+3d
         s5OPhkkCY4reWuNO1uehVF3iFIpSwEHPfZgrEvZZWVCwKOapcfPsR5r9wG2blsWTaLDZ
         +uWbO/y5f85TiwCD+85/J7hYgM1aMOp1r00+/PnAwIO1zbVEaqSyiYuoivJ2TZt0urKg
         mDASTjCpq8qpik2P1NZiIj/RbJ5vMKZaa68gxn9dEqD7dzJsravPggkjXzgkyWGN+F4i
         raOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=B9hECeXHcuOymia+nBWNNHhzslixpuFml9zqgh+iJlY=;
        b=nXUkhRdPmrZ+H5hBrtFSTyMMguHgAqaUF3IjKzuzEXyxUoJqSJhbljKV3hOsnEM+oF
         t8Bfq+VrwMZ44M2z8nW+VFXOPE4k6y65h1Y8aWOD7RkyqHJ0jaR+Of21pkwSxKlnW26Q
         AZqyJFo8z/vT+DEJ5NgJDNPR51hjXNbbxL5e18JxBdfmvIhMn9ifvb4vEpWqWDKxBXk0
         oZVwXcGEmWQ2PgAVqTL9CahoAKxUJIls/8LRWne2zWbAJvChjzG5rD8qaARxgu/N7wkV
         hc5xXWay7pD2ltzeH9AC5IutYPA3wass0Sq43lG5Y+7nbtikXs0AK8lPOHkIpsLV7AwC
         4q0Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=B9hECeXHcuOymia+nBWNNHhzslixpuFml9zqgh+iJlY=;
        b=ZH4wj/cEtbFagpLQOkEaq9NqHFn9Y0MjozhBl9CP6AVy47b7lOtM5nWqjdIBUOxCd/
         2cmI2C5SXY66+RBYaY6XdctRRPpWfCRFTA2VEme7XT9VSQ+VRx/UzXlHkpVwhxjYtnQr
         oE31nORUdzcixR2yMTCpMYeZnFDeF3W31h0SHF4EBMBCwj121JGQxfiNsGni9tzaJwz4
         Osi7qedPZiKUZEYHPPKXAay8UCzxhJOzHIsEXJEUfAY62c1guEOOWVa8T7VGYmz+bsZK
         zuEK17cQjoWDviU1BP6l2I+17SfFW+D4QeZnoitVD/3BzxTFNkJLwArNdb591+34BuNi
         MYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=B9hECeXHcuOymia+nBWNNHhzslixpuFml9zqgh+iJlY=;
        b=Qgy/pdE6OndXYt8BuULzpsif0/fwWskGmV6tDToz+tUFpYBlYy1fQIPlT3IBWAsjFW
         6oUMIOIzdaSYlhJOwac+f/rAdcTlB0C728Z67i++Y1vEtVuKavIW5DhmZA+umWwINA+e
         /BX3O9gGHahbsuIoelUHXcInNOUqWXYP01GX1ZhjDF7j/QxBkDOHqX2FGPSUK4PB/mXu
         xGtNEjaLnpijsbdilh3Z4+f6UL1NiLnkuZLLLwMCqN0DGHyRdaQ0dhTNnvtXqSvDs5FD
         m9RXorqSUSV1QHj2pBciI1qjf9F3UeUrCd4kkUBKwwKrzb0jiWfmNYHtJkpGp7b8Snpg
         newA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXovkfd1AC2SEg1gLvy6/EPFZKPzkgERes2HthhdLoPV2nWxwXY
	icm67wSQg78M+yPpWQcPRsk=
X-Google-Smtp-Source: APXvYqxKs6RL9fWYvOZ2/zgefLAOBk4J94+GOKIIBLe+OZ+ZJ7ak78tTMYUnkoCd92UHMuDxVziyYA==
X-Received: by 2002:a19:5f44:: with SMTP id a4mr20258413lfj.45.1574700958270;
        Mon, 25 Nov 2019 08:55:58 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1119:: with SMTP id d25ls2500419ljo.13.gmail; Mon,
 25 Nov 2019 08:55:57 -0800 (PST)
X-Received: by 2002:a2e:3e0f:: with SMTP id l15mr23445973lja.209.1574700957464;
        Mon, 25 Nov 2019 08:55:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574700957; cv=none;
        d=google.com; s=arc-20160816;
        b=fcKg06FNqb3/rdVq5+H65IwAJNtuAl4PBejFwQPXEYkmVmmDJ/45y2C+LJwvTBO1BM
         uyuxHm6hdnOIyoedwaKYyRb7wnUwvzkcY7D9QzAN9Z5FY+QUPm2pA4AYl5Hv8W54FBG/
         5FTvTJ2R23qLIfFEzvLSdqyUEP/l3x1gNCTkKHjTM5JvWSNui42X+gfxyyvIOY9dIjRC
         VBrFT9LE/sgFAD4rZc72zswTydVI4qj15/6s0KbYHD8lPavbcXgAWy+jG5NT0ezgBZaE
         z1XDIhCMM3vWVwQn3PjpV7GiHZkzvJQRc96qHLw5i1DTrhMBWBWevM7Ij8LOfX3AxBj1
         1Pnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=7CdCOoAqGZnJ5ku+n/C5YhuvuX/dFDV5LFx9/kVHXhE=;
        b=U8/dtIVQBWmbGzqUveRMCNodizDWscSNchRpSlaEnnZyuFBtrGWH+SMts4OOZLbIaC
         VqkkcexIbDZ4nrjb/0zYDTDRWMX1M4s/RQ9ZJGNvJ1qWvy4/GEHut3zt0zGD8lpbPsOI
         CGf7IHwGyg57KaWPN9FppuzNVl2Pm7S3RtLTK3j2t+OrpCVZ2ZyeXSPScxuk/7Xjmui4
         JIRd8LZtZfxqVcbktn9ymrX8/WEavNp0YLX5Qu2JgxGBUeMP01AIIKg9foUzx5rbwbLx
         dm2Kqu471BNmDi9g7YL4W4Neudjs/QP0htY4M3d57yMEjwqJTpgLwG/MM8YMLIrTuIn9
         rK2w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id 68si284763lfi.3.2019.11.25.08.55.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Nov 2019 08:55:57 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id xAPGtue4000637
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Nov 2019 17:55:56 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xAPGtuYT029329;
	Mon, 25 Nov 2019 17:55:56 +0100
Subject: Re: [PATCH] tools: jailhouse-config-create: fix python warnings
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20191125162437.1327636-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5d7ed362-0d7c-eb9b-1d8b-64c2e055d2e9@siemens.com>
Date: Mon, 25 Nov 2019 17:55:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191125162437.1327636-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
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

On 25.11.19 17:24, Ralf Ramsauer wrote:
> Python 3.8 complains:
> 
>    GEN     /home/ralf/jailhouse/tools/jailhouse-config-collect
> /home/ralf/jailhouse/tools/jailhouse-config-create:230: SyntaxWarning: "is" with a literal. Did you mean "=="?
>    if ((options.root is '/') and (os.geteuid() is not 0)):
> /home/ralf/jailhouse/tools/jailhouse-config-create:230: SyntaxWarning: "is not" with a literal. Did you mean "!="?
>    if ((options.root is '/') and (os.geteuid() is not 0)):
> 
> Fix it. And remove some parentheses.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   tools/jailhouse-config-create | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/jailhouse-config-create b/tools/jailhouse-config-create
> index 46de3f65..e746dbf1 100755
> --- a/tools/jailhouse-config-create
> +++ b/tools/jailhouse-config-create
> @@ -227,7 +227,7 @@ if options.generate_collector:
>       f.close()
>       sys.exit(0)
>   
> -if ((options.root is '/') and (os.geteuid() is not 0)):
> +if options.root == '/' and os.geteuid() != 0:
>       print('ERROR: You have to be root to work on "/"!', file=sys.stderr)
>       sys.exit(1)
>   
> 

Applied, thanks.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5d7ed362-0d7c-eb9b-1d8b-64c2e055d2e9%40siemens.com.
