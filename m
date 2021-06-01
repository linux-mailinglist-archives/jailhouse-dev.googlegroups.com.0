Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB2EA3KCQMGQEBATJNQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBA1397A29
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Jun 2021 20:46:01 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id x9-20020adfffc90000b02901178add5f60sf1218537wrs.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Jun 2021 11:46:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1622573161; cv=pass;
        d=google.com; s=arc-20160816;
        b=CZa0EYoEU6eDqzvM3mC598RYxx+tC/+qwYShdaP6z5qrKZoy8f1UCHZ/ixLMUcJ3YP
         XPqtJLjn6M68fkdI3MEIEL3mL9mtOYt5lV4WLik/2w0xWJz732SD/vEB+AdhDNoavEyd
         E7eY0Y/pt1RZ6WnyVTEkwQQT0SPVemrQZwjEqCMtMCK5Gm61ex7urV45qX6P6Xe0TXft
         67M8U6EvXXX+oDFeWac+eyljQxTkpKn8AcK4SBorfMNfqM+Q1ldTp7aM3KjP6yTN9hmn
         Qxze95ZGn4fOJZ4iTJTQHbm4/zIoWy1psZkKQyU0W7H/FV6igTlJPoGfVBnBift+d9oh
         jZXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=egwiZVopcug8J+xkHURJgWYuXdu76wx867E5PjzLJXo=;
        b=MIXELR7/jJHiDj3D+2RHorrjSFqa1k1xFRq4eKv3ofgbMETdLDHR2wlHkxD9ImsS3j
         b2lARHDfJcOuWd6RnAVixmW5ZyNi82EQypCYWh/wI1IxEUCSfuyl7st0COFeRRQNeyxo
         OTOW2NbDJQ95/y5zXgWF8bDPVhXMJUi1Lb3Y85t2afyZs/geWSD4xye9bCuvG1o+8tyj
         2T8qKnXZLmGBdnVhPV1siYZOsiYnw7yLnUpBKmpfFGZJsW3eSRcQE8TJLNaoPDTp0HqX
         M8k9Bm8NbUkplY2+XV6vq0Vzsf0OyrD512tSGdA0CbmqpsFoHVYCrIGRY87d31cYcJ1a
         Bw6Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=pO8GRoBq;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=egwiZVopcug8J+xkHURJgWYuXdu76wx867E5PjzLJXo=;
        b=IQz5ec66YXaU6gRp3O/ZJzE9NB+FWu+GJzcl09ABBdFiBAcFEBNMxsZvWMCT24yx9d
         mToHSsaPUvx1F5KpGix5/6xG/GoY6udG27Gjt64yEJTF4ccFQrfSRuCrIXOPLitQTjcI
         cqwB85Y/ojNauhbNfRtqWFUKF3BKLbus0+nKTbbk3TRbowSley9mRqOlKR4ciGzDA5iD
         z0pq/x9M5F1S/A5VcBgz7w//ZKBe+Ph8fhOFwg3sJLZXIf9iikG6LETaFfG6mlsOVD8j
         4xHzLmaXarFJLDZ33cRJ89vur6J1xM8NIvvRPhnIh0wnoFzeYJQQd5y9i961aIDIc4HV
         TBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=egwiZVopcug8J+xkHURJgWYuXdu76wx867E5PjzLJXo=;
        b=NdSxrA4DnaHSofTerVp/qMNfWbxGvedzC+nyJr5h3yYa0g2WBl9IURny17tMUUHmaQ
         lmUyudYi8uxPeW2NZarimTNGvw2q1J4gWSp02KLynBAZZnNPWdzD7P0DGpLN5smunnio
         Kyv3te8AznchZ5c2C/u34H9xttYEHA0yv96GwuTL5hsZ62wxIErJ73l6FQ3SOJkrNx+a
         2KsIItOy2yF/OeqACjIOTVqziEqmM+WWmAwdcG2i70v1f9tR/mKK0auH9PLbfz5jGr8T
         2z2pj89do7G1CbTav9V9Ftqje+w4yOphCDekd07mBenzJeTld9QUAG0ObwynDVdcPrCh
         QLEg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531iONfZhkrTr4yI4rkAvAI+0kn8MpesB9JBb2qwgzhAYV259jk8
	/AQaDWTlCHJpMBexW0IUAK8=
X-Google-Smtp-Source: ABdhPJxXidDRCTNur7cp+sESim6W/1oI4ReqWNqpVnuRs/07RgkF/MjZWROhESiTUXG1h7vTSzZYCg==
X-Received: by 2002:a05:6000:1849:: with SMTP id c9mr14813693wri.140.1622573160918;
        Tue, 01 Jun 2021 11:46:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9d42:: with SMTP id g63ls877535wme.3.gmail; Tue, 01 Jun
 2021 11:46:00 -0700 (PDT)
X-Received: by 2002:a1c:4c10:: with SMTP id z16mr28471658wmf.0.1622573159905;
        Tue, 01 Jun 2021 11:45:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622573159; cv=none;
        d=google.com; s=arc-20160816;
        b=sOtjtgFXsJ+LP/ASiszkqVFQ0LkzGa6QkoB/1sQvxleLwAclWgq7d4Rlo4Q8D+7cPt
         TcPz5t90cBX3UrEIMl1xJyMFGvtkEadiEBOhtpl/5K1lkJZF0r+ZeKeL7XWx3NhkzpSt
         b/NG6lRbJmKcqIehtJE8zGpOyDWAkr2FS6GJIfhQcexnxGS17bxgB0ZbGupekyEPhE2K
         xlhd0I45orbyX9RWUW1L4nhfnik5mU4EHeCymXm0SBmLv1/jjYKlyeg7nVH4sn+DhoZL
         MMliZn/htunTCXkpM2OJD8hzkVPlTJ/Q6pTSfNYmLE2DzNgWAOAsqnzWoy/DsrQOU6/8
         7FUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=qyKhlk+OeZolAo7YFncUlpcRpziPMbKlrKEjYnyheJM=;
        b=cpb8c9KGofPH2uRoOyqlxeuD5us9WJ4Pb//rf7vsWR02rVzbkUOQukIyF3blBiTnsU
         sywB25/X3EFUiPmUk01kuJ9+03ZWQJwz+UqesYTL9dBQrrV+M1nw/436A5s4+v/lJm+0
         NZ/L/VAS0tLsD/KfdL1kLocWoKMcAKBLtKT7GJE7OlPNICUDC7UH36V47rVtvi616XuT
         HyD/uZYRrRHOeXG0EC3FUPHIMDRESYnz4JMZtxEeZCp284k8PCXeCGmOlXheME9yZBQo
         wRS9KaodRUQeEyVbGs2gFb5pQ/acps21Yad4kgnjsuOU7bSOlEqLoWX0GkPAT3NAUXyd
         dKsA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=pO8GRoBq;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id h7si20244wml.3.2021.06.01.11.45.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Jun 2021 11:45:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4Fvh1z3VBdzy41;
	Tue,  1 Jun 2021 20:45:59 +0200 (CEST)
Received: from [IPv6:2a02:810d:8fc0:44bc::1455] (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 1 Jun 2021 20:45:59 +0200
Subject: Re: Installation error in Fedora
To: Florian Bezdeka <florian.bezdeka@siemens.com>, Henning Schild
	<henning.schild@siemens.com>, Prashant Kalikotay
	<prashantkalikotay1995@gmail.com>
CC: <jailhouse-dev@googlegroups.com>
References: <CAEoyBwCDWM=+iUXzXtECTpugFprTkMSj-P+goS0R8yOizZTYdg@mail.gmail.com>
 <20210518154123.18b0ba78@md1za8fc.ad001.siemens.net>
 <c70b4564-a830-5e40-a7d2-ced34578027e@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <eb84ab67-7711-841b-6d7b-99718e1fecd3@oth-regensburg.de>
Date: Tue, 1 Jun 2021 20:45:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <c70b4564-a830-5e40-a7d2-ced34578027e@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=pO8GRoBq;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

On 18/05/2021 17:00, Florian Bezdeka wrote:
>>> /home/prashant/jailhouse/hypervisor/arch/x86/vcpu.c: In function
>>> =E2=80=98vcpu_reset=E2=80=99:
>>> /home/prashant/jailhouse/hypervisor/arch/x86/vcpu.c:429:9: warning:
>>> =E2=80=98memset=E2=80=99 offset [0, 127] is out of the bounds [0, 0] [-=
Warray-bounds]
>>>   429 |         memset(&cpu_data->guest_regs, 0,
>>> sizeof(cpu_data->guest_regs));
>>>       |
>>> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> This is a warning and treated as error due to -Wall.
>=20
> This warning is GCC 11 specific, the code compiles with GCC 10, but
> fails with GCC 11.
>=20
> I looked into that a few days ago and considered that as gcc bug. In my
> eyes the array boundarys are not correctly "detected" by gcc and that
> might be the reason for the warning. Not sure if it was already reported
> upstream to the gcc guys.

Do you have workaround to suppress this warning? I just hit that warning
as well=E2=80=A6

Thanks
  Ralf

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/eb84ab67-7711-841b-6d7b-99718e1fecd3%40oth-regensburg.de.
