Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBWEJ5XUAKGQEZ6GF66A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa39.google.com (mail-vk1-xa39.google.com [IPv6:2607:f8b0:4864:20::a39])
	by mail.lfdr.de (Postfix) with ESMTPS id C97CE5CEB9
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jul 2019 13:49:45 +0200 (CEST)
Received: by mail-vk1-xa39.google.com with SMTP id l68sf127972vkb.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jul 2019 04:49:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562068184; cv=pass;
        d=google.com; s=arc-20160816;
        b=dFtlpfAC3J9XWGFhZ7e/3IhuVtKtluUrPenLpn+aK6EZsZ2kcyUf14UXSNLUNsEF7l
         8YaFwbvuk5YH9vji9OvrkJUC+oEyRMmJ9Ge5DG7IIkAWd1hPI5+BP/35hMQA9UzvBwPc
         InA79VSQvweem90TwEe2syzpPLNugjNSHzULDD0IH4I/wH9/sv/QSbqJQUbexRjaguFP
         LUXi6Quv12BXAjw+5iT3tORSaf1flnccMV0GN7OkuaOnAotLNV9dzmX/kkSZO+t3c8qq
         BIgZQivrp2UWgDvUSdUxdELF1CkxQlRLjlf++GbVYubVWE591o3cKW/v4bU6yEqiXfZZ
         UQRA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:mime-version:user-agent:date:message-id:cc:to
         :subject:from:dkim-signature;
        bh=0YkVZyAvPEDogh89MjQNRHByIGglmVh0NVZEfq2HmIg=;
        b=AkUDzl+ibPparvSIOtKPW27b3fefWs6ssPOVHmbRau3xsLKuiOm1y8wx/0UFoW25yb
         Yp2UaBcYSXcoz1Foa7lDl/chzPCh3QEnCEm3klcyJE1jZEzqJFUS+hPvcZS8Gz12LCSt
         9YjEWCgdyOfYVRC1by+an/nU5UwMBjsIyqhHVgeTequcqvaCMhuB5Tth1Tajq97qfDAj
         UwkgTwR2kFT2vXTojGZuVcRge3J9XZQidfhzkuf0OpwNN4XO5wlYSQcv6I1/nKhcN4wv
         Ahuc4fjeTl3yNpYxdEGlALzOkPh5fTnmGtwoh95JaHxOy4z2QS8tkm5LrFrWapGkFO/B
         RqMQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rVeNhEfs;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=0YkVZyAvPEDogh89MjQNRHByIGglmVh0NVZEfq2HmIg=;
        b=VbtkRXHpGfuXkR90Iuj1I/70hTCFJbUfHuaqVspbVwvVnHAGdEH/W82ObSoPnphmz/
         bJvY7WJuMsqGU/l74fcmVaVYfZ2BTVh/2R0ala+H1IqPnUfoEIqnDFyyba6Z99Jyg9bD
         cIdzaJ/hYUE3fKnHEXjfgcCu0bjmAuI/B0CnXdRXXqBk3RQ1N3lco9Hyl8uqJuul3kL+
         Dbhh+RJwyS7x9UY8VHFmvjlFWV0+fyVr64taGKXswogp3ZHzub43z4+qR/l7R+4km7/S
         TXTc3rxlByr5NwEnqr1EgLgCMLJNyCK5Fet1oGB5XVxZN/w+4c9TcqHYVMbcoE+NIAX/
         AQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=0YkVZyAvPEDogh89MjQNRHByIGglmVh0NVZEfq2HmIg=;
        b=li2pj4+aFSztx+rZaFioTrr5kcmUfRnZ4LiPgg1b9gkhh5y6D4xP2dtAO9iabOEP0e
         PucK2KZ2xbslhF9giFcMr0ZKNesAv5a/zupUG5cWjXPr9uBvuWomJWdkcqBlMCa3IrIX
         i2xKanfDR8nCp9XDlgTo3xcFhOECLo/RwxKw4RaqivU2AujgUdyXeQr1Bl/F76KStV5L
         pPjoTqPqKHCNDo6P8YLC8dA+hEWHRkhKZOltRGSOml2c6NglJa8btuO3+TiA7utNxf8b
         XIWfotNqBGXNPTKLjqJ8+7zotlnB+ns3NM4qEdXgpOSkQ7DWYyB9vp1K1hazBn5S0bIQ
         k3IA==
X-Gm-Message-State: APjAAAW0ZjQzqBhNx9PHlPeDqkioNJ0nEs0M3aQsKIN9eoi+oPxlW4Xg
	sPpIJuI6MkphSuBnf5Z4GGc=
X-Google-Smtp-Source: APXvYqz+0J5nGJ401gUReOGsVOWXtIfEyyarLAn/wUJ8YFLbRApf57emalv5NgN1HGBSgxeL4cWT4A==
X-Received: by 2002:a67:e446:: with SMTP id n6mr18438337vsm.142.1562068184480;
        Tue, 02 Jul 2019 04:49:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:7d4e:: with SMTP id y75ls1324404vsc.2.gmail; Tue, 02 Jul
 2019 04:49:44 -0700 (PDT)
X-Received: by 2002:a67:e20f:: with SMTP id g15mr4205949vsa.49.1562068184126;
        Tue, 02 Jul 2019 04:49:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562068184; cv=none;
        d=google.com; s=arc-20160816;
        b=XYg10M6shUX5oHmSTTvSC/WP8dJ1uNYQXXBcssw/VvPSvXOg2tUvItlZRbt4UKwunp
         2NefPGST9/KMLgS0S69zqmarg6tdnoxiGpuVzA3hSY1YE3ixadgOQB9MoW6Jo/qtSb6/
         T1SHjVKXcJPgcPLaiZiWTATsaAxotkznL5Mw+pmuUSg/n2fFxehYrtysyCajiEp9CRqD
         Pl8drEQ8+0YgKkhqj2xBCpGXoytYmF2Xe7w940j2VI9CRoUJrBjZPwN6pQ7XLGZhu2LN
         q3RwAZjkBO9Ww+dyiOoj8NxpPZnh3+XvSOMoKIqM1P7JDH59wcQ/Fr+T2cQVkClpRYTv
         x4tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject:from:dkim-signature;
        bh=Z0FBfIyh/gA8FihT7VpAPxAj937eygYayrH9HcMqG2E=;
        b=g4m+qFgpfK0tQKzUg+0+YEqMxLRxY4FZucy76ojVumpsED5VkeOPrcx89ra5NUxk0M
         h4bN5ibYhzAPCuUEzITEadWAXxvBA0YvhN0ibZxN72L5sxX5P0OV/4B0Tgiigmlr7x/V
         2g+b82xHTzKrc2NSXx5CXh1OEN5qIfPgt6XatFt5fzl2rPnLGj5vSUeM3qbDqXJE6pqr
         XvINp4t2L5FTzWlnB5Fc/YkLKqStt73L8h3AVhfqT8sl/XwrvQc+V4Q19LIwhQNpc1/c
         1yRwiJC3dt8sMq/QjMrbK/hpEAmxPGMfJyzaYWqSBEeEqqlsLKJYtEv7pHaiBMF5G/l+
         JrrQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rVeNhEfs;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id e126si609336vkg.5.2019.07.02.04.49.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 04:49:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62BnhGf124845;
	Tue, 2 Jul 2019 06:49:43 -0500
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62BnhCk091857
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 Jul 2019 06:49:43 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 2 Jul
 2019 06:49:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 2 Jul 2019 06:49:43 -0500
Received: from [172.24.190.229] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x62BnfUg012566;
	Tue, 2 Jul 2019 06:49:42 -0500
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
Subject: Locking pages allocated via paging_get_guest_pages()
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: "Vutla, Lokesh" <lokeshvutla@ti.com>
Message-ID: <dfdf9509-c3e4-e700-e3f7-56cb1e189048@ti.com>
Date: Tue, 2 Jul 2019 17:20:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=rVeNhEfs;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted
 sender) smtp.mailfrom=p-yadav1@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Pratyush Yadav <p-yadav1@ti.com>
Reply-To: Pratyush Yadav <p-yadav1@ti.com>
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

Hi Jan, all

The pages mapped via paging_get_guest_pages() are mapped on TEMPORARY_MAPPI=
NG_BASE, and the mapping is over-written when another call to the function =
is made. This produces a race condition when two cells have two drivers cal=
ling this function. If one driver is not done using the mapping, and anothe=
r over-writes it, bad things could happen. Of course, if it is the same dri=
ver in both cells, you could use a global locking construct for it, but nei=
ther is this a very clean fix, nor does it solve the case when two differen=
t drivers are in play.

One alternative is to lock TEMPORARY_MAPPING_BASE until a release function =
is called to release that mapping (using, say, paging_release_guest_pages()=
). If the base is locked, the call to paging_get_guest() can block. This is=
 problematic when the locking is too long. Another option is to return NULL=
 when the base is locked, and then it is the driver's job to re-try.

The second alternative is to do away with TEMPORARY_MAPPING_BASE entirely, =
and use the remap pool instead.

I personally like the second alternative better.

Either way, all code using paging_get_guest_pages() needs to be updated. Lu=
ckily, it is only used in a handful of places so it should not be too diffi=
cult to update.

Thoughts on this problem? Any better ideas than mine?

--=20
Regards,
Pratyush Yadav

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/dfdf9509-c3e4-e700-e3f7-56cb1e189048%40ti.com.
For more options, visit https://groups.google.com/d/optout.
