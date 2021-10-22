Return-Path: <jailhouse-dev+bncBCIJHPG524PBBSMQZKFQMGQEFIHH3KI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3b.google.com (mail-qv1-xf3b.google.com [IPv6:2607:f8b0:4864:20::f3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACE14374FC
	for <lists+jailhouse-dev@lfdr.de>; Fri, 22 Oct 2021 11:45:46 +0200 (CEST)
Received: by mail-qv1-xf3b.google.com with SMTP id kk3-20020a056214508300b00382d8d1bd71sf3366178qvb.7
        for <lists+jailhouse-dev@lfdr.de>; Fri, 22 Oct 2021 02:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=UwLcjtN/WEmleYObUey/xRWC7McDMsaAGWk8eNX0/bg=;
        b=DzUuYb0WjCy7DNydK88ftRkzGsiZymOllmzXh51ktvYSozNe9KprWxd29xEd0HDOZx
         Zd57H3U2nSrpU7LLfkX7+zZwS6FnEjkNEkYb5EGgobEHIa1O94ppsHXIxj/Qv3oJl/V2
         Ku8KT2jZAoPV9ZVHHfH39Oq4kaZtw9uQtUNz8LgSutnKOGYzi8mi9bGqDsgak4VhORwY
         Gs5goHXcLd7jYw5esl5BWH3SDcsrLkGQqvMIojRMqekxZj9PbbhViNbky6RE/Y2xSAA1
         qfR6nyxQinrTvbeaDcy+abGY1gkTUOXlpFBhGnzmss8chlMdlaxYoAT7MUU8vf9KyDb0
         lc0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UwLcjtN/WEmleYObUey/xRWC7McDMsaAGWk8eNX0/bg=;
        b=WOXPtV3gGW3A0sxZJtXhVmjLA1PIRh1gtQE/Bdi8J2qsFDAeIG6gkl6zUxl/DblL9Q
         JlykcOkchBZBGyBJOhCEqQyeiKuIwrqg8iKnid3boPeirJc6oKc0CBVurrjs7Efx3BZn
         CBRJDZfjWgmWhdaROeB/PdIZ+hPl64YLteka7b9eNKewjM4coYskIUfGFb4viBoIh+jZ
         yKS+WT2pJb8bJFuMSb9MqqOiiNmy1QM2l0Jjk0WzHh9HCDNFMRfWDksD7Fx4/7uDzGRK
         9ly56+5kr4kZTYu91FqA8sGSuKMeKuQ/WxE18UXceDe4ePAUNs2cQjMzKgwT2Vl2uziA
         zlOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UwLcjtN/WEmleYObUey/xRWC7McDMsaAGWk8eNX0/bg=;
        b=rH7tvl4JDlb6nP6jJ7Iwfh4fvYu/B3YB4bjWFi5K4Xtyv7hEzXGHMSPaTn+SuId7hE
         3SiNjugtgWmwzHmpP5Vj7wKSoEsJlExZI8AItRqbwxx9eaj3tzbtpRJh3KboXENaCMqF
         cVzAeoS1n1TlIyfyLl9P0xYbFOVd9Ny1lB5NrG0eI+JypYxOcpvGaPK77C89mksveCWA
         vwSyvUB1jUpK3e5tPURmjCrPk9PAPIhJ6QjTYUcWndwj6g1lOjf2DPr1H6TOCQSaWt9Y
         zBwQnx+Po5TCmumAdQChzf6XIaaRCYIRTw1PLGEWG26S8SrqH3aqtTnXrgyP+quZxBaA
         v9/g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530WdLvszRUD8E61HZxNnnQAkdrfnj3E/YRZeFkHnJL0kmX+WMcf
	vVxlkY8V/IHyYjK/o/dzlRo=
X-Google-Smtp-Source: ABdhPJzXVRJ+EisTsm64I3n510SfbvYuytxqpVpI+CDFnLEPBBM/zx+vBa1TlpkRDHLBn/FLiUwczw==
X-Received: by 2002:ac8:7763:: with SMTP id h3mr11599631qtu.159.1634895945302;
        Fri, 22 Oct 2021 02:45:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:318d:: with SMTP id bi13ls4378986qkb.9.gmail; Fri,
 22 Oct 2021 02:45:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4612:: with SMTP id br18mr5715385qkb.405.1634895944811;
        Fri, 22 Oct 2021 02:45:44 -0700 (PDT)
Date: Fri, 22 Oct 2021 02:45:44 -0700 (PDT)
From: Andrea Marchetta <marchetta.andrea@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c8079f2e-4e88-42fa-8fd5-e852a6f98a10n@googlegroups.com>
Subject: Building Jailhouse on STM32MP157A
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_824_958468716.1634895944270"
X-Original-Sender: marchetta.andrea@gmail.com
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

------=_Part_824_958468716.1634895944270
Content-Type: multipart/alternative; 
	boundary="----=_Part_825_1917152987.1634895944270"

------=_Part_825_1917152987.1634895944270
Content-Type: text/plain; charset="UTF-8"

Hi, i'm currently trying to use jailhouse on my stm32mp157a-dk1 kit for a 
research project. My main concerns are the followings:
- first off, i've found the device tree for my board, but i'm struggling to 
convert it to a suitable jailhouse config file. My device tree is enormous, 
and thus i don't know which peripherals are mandatory and which one could 
be skipped altogether
- secondly, i'm not sure the linux distro i'll be using, which is the 
openstlinux one, can work seamlessly with jailhouse
has anybody tried something similar? As far as i know Emtrion used some STM 
chips with their boards jailhouse-compatible, but the address mapping is 
completely different 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c8079f2e-4e88-42fa-8fd5-e852a6f98a10n%40googlegroups.com.

------=_Part_825_1917152987.1634895944270
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, i'm currently trying to use jailhouse on my stm32mp157a-dk1 kit for a r=
esearch project. My main concerns are the followings:<div>- first off, i've=
 found the device tree for my board, but i'm struggling to convert it to a =
suitable jailhouse config file. My device tree is enormous, and thus i don'=
t know which peripherals are mandatory and which one could be skipped altog=
ether</div><div>- secondly, i'm not sure the linux distro i'll be using, wh=
ich is the openstlinux one, can work seamlessly with jailhouse</div><div>ha=
s anybody tried something similar? As far as i know Emtrion used some STM c=
hips with their boards jailhouse-compatible, but the address mapping is com=
pletely different&nbsp;</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c8079f2e-4e88-42fa-8fd5-e852a6f98a10n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c8079f2e-4e88-42fa-8fd5-e852a6f98a10n%40googlegroups.co=
m</a>.<br />

------=_Part_825_1917152987.1634895944270--

------=_Part_824_958468716.1634895944270--
