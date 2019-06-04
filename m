Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTP43DTQKGQEJ5Q34EQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6BF34380
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Jun 2019 11:47:57 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id v7sf2501809wrt.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 04 Jun 2019 02:47:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559641677; cv=pass;
        d=google.com; s=arc-20160816;
        b=WETntpJqqri0S08/JLtXXCp6/cpqtsxgqwKbKVruGfR+UMIVLqjHPKp52LoAYpPAqF
         ZpR1hu5c2d/7iuJSEYeyic1lkMExdh4GrYgEc8rvwgaxeAExcPz4ScvgLRpvar4eF7X6
         beSHy3wfGKfMQa8FXIsXGjyMB26NMfLOlQU2j8DE0MWieYVt4VeGJE1M7ZFDr8lCY73A
         KT5pRSUB8Lb+8OX+VqqTFz/9c4VXAaGCAM0UGBkwcejdM+miJfNIQ8nub/D4nJPkQ2iz
         MjSD100mK4nkTDNi+xIzkThJvoUukPEvnh1hTPL59YCpc+bxODNih9tFzvXRxUDF3PI+
         4Jkg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=NCClR5XNzQE+9f7AO8Vi7Q6wu5/epNfeGvQNrL/vgmY=;
        b=ffYZOguHQe1CnPRgCPwK4gFo37YhTtTwnOn0/dkfOdsTHPmShOred8/P60YA/3gN+/
         s1TQ0rAE/vzoABFyNq44IAH/ilzhmoxFKqOsArNUCFYen4zFdJd/5WQimhPFJwSM9Pbm
         EQlqbFiwwK0Q2tyedzIgTr+0D3dNiJyi8+featK9sxkDHyL0g7xYgrfJJeG/ND7vyiw4
         VamNpbXl/LR6zIVSj1BVDeQvS3yHQrtjXgx8OXAH05oMIwshNio7LCIBHiUqxgdf+UAD
         2cmTYJemS0H9Y8xh4++REMCPVaeXyCdSlLbD91q/I0vbDciY7rRznh2kwyp050ozkesb
         VfQQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=NCClR5XNzQE+9f7AO8Vi7Q6wu5/epNfeGvQNrL/vgmY=;
        b=BdyNxagOv6P0DJygkpk4x4xEBISZ440ZmcnA30h0fqOBLi/KnfLMK6oOLliWVMB1s1
         ob75lMSnHnoGy5H3UnjhG4bW5NivLopqep5DzhwHrgS8WCHux3Eq3NgmqmrhK/wW3LXU
         LRGDZ2HUXPpQiExEz+zclxPaMWU7I5ZmDvCT5anwv5mTvuFki6yJRzQVbotw3ppTbCmx
         ayl3nq1vLNzNC27HCrv0NUkghSBq5tOZIO0r2c7jHosrVB3sB1mQkRzitTl6gWHx2biz
         qyTDE/28fXYG0c3z77/M4+99rltApouGgp8McyEXpjWS4K/og4mNoQuSLYQy/tNWgpH9
         IoZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=NCClR5XNzQE+9f7AO8Vi7Q6wu5/epNfeGvQNrL/vgmY=;
        b=W55Uk4Zi5er1KggeiSq1pYc+B2vZfOZyIJcIq21v7KDRjgrOV5jIdBShxJ9udiIEyq
         BNPH6yAlBW/jTYthL6O2d3+yhnI2VjbzvoMwGT/puFjQ/h2WxxmM7Z0mi7yFxpeuFdAQ
         FFMjFHbuq2XCDzUttFaPBaAvX1GkW8Ypfr4bBtIusQHqtkfpJy4l/6blj+Q9Tp1+Jauh
         J2NUmezHTKJwYx4u3rzuc2PVIlRqeERFzGxgL9VrNYO0cV4ND3jA36NpeLxgXLSEiMwl
         K3sNOM4gaKpumaeyJXnj8lGEqBbYXL9mJM9m5E+KdVvHuriCkzhHIXo+3sLxKUqm5Xe1
         y/Nw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW42Es6ln4/ijGZZRsc/Jtr270IhiaRJNKCrAiIxDzvCYBenCOi
	hH8nTenObZv26pqwHmbdGUM=
X-Google-Smtp-Source: APXvYqyA5ZjbuG6dK60j29BW2cy7A2No4B6QinD0lwjBHdwEP4HtjIQcRpOyRL7m2xcq1lUebIurqw==
X-Received: by 2002:a05:6000:10c2:: with SMTP id b2mr7043488wrx.57.1559641677331;
        Tue, 04 Jun 2019 02:47:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ec02:: with SMTP id x2ls1138965wrn.6.gmail; Tue, 04 Jun
 2019 02:47:56 -0700 (PDT)
X-Received: by 2002:adf:e591:: with SMTP id l17mr9396179wrm.231.1559641676611;
        Tue, 04 Jun 2019 02:47:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559641676; cv=none;
        d=google.com; s=arc-20160816;
        b=elVWHfuvqDbfsLW6ULCaPm6M0m+a5UCflDaBlq9dpmO3H9ktPIpE3zkCCqcdESOF+C
         yX4FmV/n0tpVL/t8SDE+NdRnh1DlIh/2jdxXt/WrHY/HHWpzxuvka5sYWMURaM4Xe67e
         wV714p1pjYPI5uX+PIseVc5p9U9k+bMwBuip61wwkd3bnEGpFMuMEPQaWyXgF0gumZMJ
         u72Jbl8Jmgzc+E8hMyM87Ky/YWcGLdrqv2F4ERzErEXU0iT9qSWhfIyxfnRK0cjEb50d
         h85r0bnpILk3nY++y/67EB2OFkilJK5aeZRTYjx4/TfhmyM1MDiBWTGQl1gCReVugQbO
         lmNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=1LKYgUe/S025jFgu/LGDBMLpQhwnaR9r1c6S2dFeS1g=;
        b=oRgFxQhHSkrlRNItwfp/EomWBZTuLDj5IqCkPG6PnFZjzI29PesWjEwXHfKShMPfZg
         Ej42dWVwrQPwEAoFW9l0f450yV/cvTiDh9dNoOxz15sOVL7nGmkfnOs8z6mbRnMmCzJK
         T2ar8Rl7z09BXqYQjXZM9G9kV3lUqWyOit5BbmKan6OvvhXgk3r4veBh1YdKDY+M6r9e
         qrMuIhyDrjIpKkLc0AVbFCL7XQHDlq9K5oHiTboxXXvFcbiPcaOzmi9dGlFG/v9v12M0
         AR6TiBY3BW8IiVXENqeBk0RxXfGpYgflH+6CntpXQiWo7VbwUKFicNyOwlV/iVcs30O6
         MHvA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id c6si801333wrm.4.2019.06.04.02.47.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 02:47:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x549ltZM001710
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Jun 2019 11:47:55 +0200
Received: from [167.87.7.197] ([167.87.7.197])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x549ltMj003052;
	Tue, 4 Jun 2019 11:47:55 +0200
Subject: Re: Freertos-demo bare-metal boot
To: johannesmaisch95@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>,
        Johann Pfefferl <johann.pfefferl@siemens.com>
References: <f8c8bb48-ac7a-4bd2-a554-0f42a31fa5b6@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <90eb1048-d5b5-7dcd-fa9c-ff9b715bd97b@siemens.com>
Date: Tue, 4 Jun 2019 11:47:54 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <f8c8bb48-ac7a-4bd2-a554-0f42a31fa5b6@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 04.06.19 11:09, johannesmaisch95@gmail.com wrote:
> Hello,
>=20
> we want to do a comparison of running FreeRTOS on the Banana Pi with Jail=
house and running FreeRTOS bare-metal on the Banana Pi for a study-project =
at Hochschule Esslingen. We were successfull in doing this with the Jailhou=
se hypervisor, but we currently didn't find a way to boot FreeRTOS bare-met=
al on the banana pi. So our question is, if there's a way to boot the freer=
tos-demo.bin from the freertos-cell bare-metal on the banana pi.
>=20

Conceptually, you need to make the demo executable at a different physical=
=20
address (it's configured to run from address 0, but RAM starts at 0x4000000=
0 on=20
the board), and then you could load it there via u-boot and jump to it. You=
 also=20
have to ensure that the demo configures its uart itself and doesn't rely on=
 the=20
root cell to do anything. I don't recall if that is already the case. Hans =
may=20
tell more about that.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/90eb1048-d5b5-7dcd-fa9c-ff9b715bd97b%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
