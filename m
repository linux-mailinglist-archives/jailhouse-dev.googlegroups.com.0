Return-Path: <jailhouse-dev+bncBDWL7NVN6MHRBMHK5SOAMGQEB4YFEJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb39.google.com (mail-yb1-xb39.google.com [IPv6:2607:f8b0:4864:20::b39])
	by mail.lfdr.de (Postfix) with ESMTPS id B648164DD2D
	for <lists+jailhouse-dev@lfdr.de>; Thu, 15 Dec 2022 15:54:42 +0100 (CET)
Received: by mail-yb1-xb39.google.com with SMTP id a5-20020a25af05000000b006e450a5e507sf3990823ybh.22
        for <lists+jailhouse-dev@lfdr.de>; Thu, 15 Dec 2022 06:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ub9ldq2PUo5Uoou2hvuKxRVssqEGvqdyT/LAR0dIGE=;
        b=XIzO368FRA5ztiP8VeojDRyWBObqKuc74n6P8liR3qdihCIShX4K2WWcFeWW/l+dpd
         BktxJNeqR8kFC3kYJMlxEB5Ah0OuSG7NeQICIYQsOcusN+H+ziqYb3o7PTACrls7HEny
         3zp2+Ic1QKXSHpqeWFzdVm2v2XFt0t0UT9UdyhB7GP3yPjYQ/NOiNZBdlH953LrOoX0f
         7YLagKvrA/O9WFPT5rwt23SrlDYY8+Rgx2nmge6zopbsvvnyi798iTtmJEjF9FRGz6/C
         ghdgfViOwUYjh8K0wD89DJyz7x8qxMBnqlDEUxSAuXNdFY/DjdeWlPkoj2O9crfiyCkT
         V+rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ub9ldq2PUo5Uoou2hvuKxRVssqEGvqdyT/LAR0dIGE=;
        b=kM79jtgtFz2meE4QUNTGYysu90VnyzwkeSs6nVNTND9ByvpO0nQtwgcPcjzxqw0Hlx
         gJZ18iJJbQuPCrgnFoLvKDhGaSmM3GspL23w4vHqVBolJbZmjK66gxClww+lPnIcfmhe
         xZq2PAlK1cj0fgh3WmmNSPAYmFIL8ZAcgazjoPnBwsrP5Rt1oWP6JIVvtvNgYCp75oOa
         0FvTTpfC5/cH/tByOT4QAczxU/4zXurPISZThARJLlVW6tI5VAIKqcPAoTyUuN8ssn5d
         tXg1jp1c0X/JbuGjmRgGRW+887f2i992eTaItYA5dWzB8i/Q3lA4HBALoazzUsNkQ6Ka
         JLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ub9ldq2PUo5Uoou2hvuKxRVssqEGvqdyT/LAR0dIGE=;
        b=7dNicTlZerVXop/gRfPplC6uTkwNpbhg78AVcxQXj3dCTMjlL9xTj/L1vRcAnf1T1a
         LiacptPdadkDV0W/DzICmerYxjcvxVBfSTy0Nouxti1Fk916oDb/M0XhzXlTHSyIn9XF
         RzYsDvyNsgi4DZ4kHufYS0sFdyUpCaoWxX7XFq2r8n4flZnHowdq8osZVcma3nuB9lHX
         R85ZdSwlJrE9MM1g8zE8ai2TT1+AzD+Kk84yqkdDMvL7l4wt5SeDYGjVtIPLFovXPVPu
         rd8hn4i/Et3F+drJAZ+cECMFY5pz5MB9MipVynGKxo79o1BABDkNQ3WNugpXd4nAf4jz
         eltA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5plyTOrvOAsJMvsVJQCjSJ7Rx8Onkayflg4DA9+eg6FZ52FDagl8
	b/ntRlIAKNa8s/GzLqQl7L4=
X-Google-Smtp-Source: AA0mqf4m+NVr2Ab+AJWbXjxDoWq8GqXD0/TKMzpw+gCIjuO2pRxNZBynCd32UWSXyaCGhbuJWDJauA==
X-Received: by 2002:a81:1246:0:b0:3db:49a0:5c5f with SMTP id 67-20020a811246000000b003db49a05c5fmr35571782yws.219.1671116081416;
        Thu, 15 Dec 2022 06:54:41 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:db0b:0:b0:6ca:10dd:4459 with SMTP id g11-20020a25db0b000000b006ca10dd4459ls14322510ybf.2.-pod-prod-gmail;
 Thu, 15 Dec 2022 06:54:40 -0800 (PST)
X-Received: by 2002:a5b:505:0:b0:6cf:e605:7707 with SMTP id o5-20020a5b0505000000b006cfe6057707mr76146376ybp.638.1671116080270;
        Thu, 15 Dec 2022 06:54:40 -0800 (PST)
Date: Thu, 15 Dec 2022 06:54:39 -0800 (PST)
From: Tommi Parkkila <tommi.parkkila@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <1f1e5b67-17d1-4dbb-b97f-92a3599e34efn@googlegroups.com>
In-Reply-To: <1f639549-e27a-e369-b60b-33e444cb0017@linutronix.de>
References: <1f639549-e27a-e369-b60b-33e444cb0017@linutronix.de>
Subject: Re: Porting Jailhouse to the STM32MP157
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1228_982661238.1671116079354"
X-Original-Sender: Tommi.Parkkila@gmail.com
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

------=_Part_1228_982661238.1671116079354
Content-Type: multipart/alternative; 
	boundary="----=_Part_1229_1326920363.1671116079354"

------=_Part_1229_1326920363.1671116079354
Content-Type: text/plain; charset="UTF-8"

Hi Philip - I am currently porting Jailhouse to STM32MP157 as well. Were 
you able to finish the port and get jailhouse running on STM32MP1? I am 
facing some challenges with the work. System hangs when enabling jailhouse.

Thanks,
-tommi

keskiviikko 9. maaliskuuta 2022 klo 4.54.50 UTC-5 Philip Molloy kirjoitti:

> Good morning,
>
> I'm porting Jailhouse to a board with a STM32MP157 and have a few random
> questions.
>
> Are folks still using the #jailhouse channel on Freenode?[1] I joined
> briefly and didn't see anyone. It seems like most projects have moved to
> LiberaChat, but I didn't see anyone there either. I also checked OFTC.
>
> It is a bit confusing what patches need to be applied to the kernel. I
> initially saw the patch embedded in the CI script, which I applied to my
> kernel, but then came across queues/jailhouse in git.kiszka.org and
> applied that instead.
>
> It might be nice to update to README to clarify what should be applied.
> And perhaps modify the CI so that it uses queues/jailhouse or tags based
> on it. I'd be happy to make those changes.
>
> I believe one important difference between queues/jailhouse and the
> embedded patch is that queues/jailhouse doesn't seem to revert
> 15ff9a39cd5ebabdf704634ea58806f2d12bbc39. For more information on the
> impact see 6e43fb65 on my development branch.[2]
>
> Feel free to take a look at my progress on Gitlab.[3] Note that I still
> have a bunch of TODOs littered around, but feedback is always welcome.
>
> Also, if anyone from emtrion is active here, I noticed the emsBC-Argon
> also uses a STM32MP157 and I'd be happy collaborate.[4]
>
> Best,
> Philip
>
> [1]: 
> https://github.com/siemens/jailhouse/blob/master/README.md?plain=1#L47
> [2]:
>
> https://gitlab.com/pamolloy/jailhouse/-/commit/6e43fb65b01a7a622cd6c2195a3bcf763bcf84f4
> [3]: https://gitlab.com/pamolloy/jailhouse/-/commits/stm32mp157
> [4]:
> https://www.emtrion.de/en/products/emsbc-argon-single-board-computer.html
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1f1e5b67-17d1-4dbb-b97f-92a3599e34efn%40googlegroups.com.

------=_Part_1229_1326920363.1671116079354
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philip - I am currently porting Jailhouse to STM32MP157 as well. Were yo=
u able to finish the port and get jailhouse running on STM32MP1? I am facin=
g some challenges with the work. System hangs when enabling jailhouse.<div>=
<br><div>Thanks,</div><div>-tommi<br><br></div></div><div class=3D"gmail_qu=
ote"><div dir=3D"auto" class=3D"gmail_attr">keskiviikko 9. maaliskuuta 2022=
 klo 4.54.50 UTC-5 Philip Molloy kirjoitti:<br/></div><blockquote class=3D"=
gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, =
204, 204); padding-left: 1ex;">Good morning,
<br>
<br>I&#39;m porting Jailhouse to a board with a STM32MP157 and have a few r=
andom
<br>questions.
<br>
<br>Are folks still using the #jailhouse channel on Freenode?[1] I joined
<br>briefly and didn&#39;t see anyone. It seems like most projects have mov=
ed to
<br>LiberaChat, but I didn&#39;t see anyone there either. I also checked OF=
TC.
<br>
<br>It is a bit confusing what patches need to be applied to the kernel. I
<br>initially saw the patch embedded in the CI script, which I applied to m=
y
<br>kernel, but then came across queues/jailhouse in <a href=3D"http://git.=
kiszka.org" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"http=
s://www.google.com/url?hl=3Dfi&amp;q=3Dhttp://git.kiszka.org&amp;source=3Dg=
mail&amp;ust=3D1671201082603000&amp;usg=3DAOvVaw2vRmdcShAE0XRgrOtZyipy">git=
.kiszka.org</a> and
<br>applied that instead.
<br>
<br>It might be nice to update to README to clarify what should be applied.
<br>And perhaps modify the CI so that it uses queues/jailhouse or tags base=
d
<br>on it. I&#39;d be happy to make those changes.
<br>
<br>I believe one important difference between queues/jailhouse and the
<br>embedded patch is that queues/jailhouse doesn&#39;t seem to revert
<br>15ff9a39cd5ebabdf704634ea58806f2d12bbc39. For more information on the
<br>impact see 6e43fb65 on my development branch.[2]
<br>
<br>Feel free to take a look at my progress on Gitlab.[3] Note that I still
<br>have a bunch of TODOs littered around, but feedback is always welcome.
<br>
<br>Also, if anyone from emtrion is active here, I noticed the emsBC-Argon
<br>also uses a STM32MP157 and I&#39;d be happy collaborate.[4]
<br>
<br>Best,
<br>Philip
<br>
<br>[1]: <a href=3D"https://github.com/siemens/jailhouse/blob/master/README=
.md?plain=3D1#L47" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Dfi&amp;q=3Dhttps://github.com/siemens/j=
ailhouse/blob/master/README.md?plain%3D1%23L47&amp;source=3Dgmail&amp;ust=
=3D1671201082603000&amp;usg=3DAOvVaw0B4HdlNdnrDtQWRwYYJL-H">https://github.=
com/siemens/jailhouse/blob/master/README.md?plain=3D1#L47</a>
<br>[2]:
<br><a href=3D"https://gitlab.com/pamolloy/jailhouse/-/commit/6e43fb65b01a7=
a622cd6c2195a3bcf763bcf84f4" target=3D"_blank" rel=3D"nofollow" data-safere=
directurl=3D"https://www.google.com/url?hl=3Dfi&amp;q=3Dhttps://gitlab.com/=
pamolloy/jailhouse/-/commit/6e43fb65b01a7a622cd6c2195a3bcf763bcf84f4&amp;so=
urce=3Dgmail&amp;ust=3D1671201082603000&amp;usg=3DAOvVaw3BllofRVcehsBUwPJB7=
mGp">https://gitlab.com/pamolloy/jailhouse/-/commit/6e43fb65b01a7a622cd6c21=
95a3bcf763bcf84f4</a>
<br>[3]: <a href=3D"https://gitlab.com/pamolloy/jailhouse/-/commits/stm32mp=
157" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www=
.google.com/url?hl=3Dfi&amp;q=3Dhttps://gitlab.com/pamolloy/jailhouse/-/com=
mits/stm32mp157&amp;source=3Dgmail&amp;ust=3D1671201082603000&amp;usg=3DAOv=
Vaw3lSFGz5RjI_5FAEE6aKRic">https://gitlab.com/pamolloy/jailhouse/-/commits/=
stm32mp157</a>
<br>[4]:
<br><a href=3D"https://www.emtrion.de/en/products/emsbc-argon-single-board-=
computer.html" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"h=
ttps://www.google.com/url?hl=3Dfi&amp;q=3Dhttps://www.emtrion.de/en/product=
s/emsbc-argon-single-board-computer.html&amp;source=3Dgmail&amp;ust=3D16712=
01082603000&amp;usg=3DAOvVaw2O3OYuVNs69eq32fyqS2nf">https://www.emtrion.de/=
en/products/emsbc-argon-single-board-computer.html</a>
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/1f1e5b67-17d1-4dbb-b97f-92a3599e34efn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/1f1e5b67-17d1-4dbb-b97f-92a3599e34efn%40googlegroups.co=
m</a>.<br />

------=_Part_1229_1326920363.1671116079354--

------=_Part_1228_982661238.1671116079354--
