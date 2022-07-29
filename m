Return-Path: <jailhouse-dev+bncBCZ3RCOBYMNBB3H4R2LQMGQE3I466SI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C06A584F51
	for <lists+jailhouse-dev@lfdr.de>; Fri, 29 Jul 2022 13:03:09 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id h21-20020a2e9ed5000000b0025d516572f4sf896342ljk.12
        for <lists+jailhouse-dev@lfdr.de>; Fri, 29 Jul 2022 04:03:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1659092589; cv=pass;
        d=google.com; s=arc-20160816;
        b=DnBmgGhlk/LQZ+ZBR4fGT5IGdVTWRDKKV2FKXLuqVb+O3kvw2kokx6eHUsDWrpBka0
         YNsbdQUWtnCXO6joB4WU+4D6Aqlowi2NEsibL8swfJPXyiBaBKnlr1RA5EZZ2JwVn/OD
         6uuVMAsCZQggnUbpXL5vJXfH1JUgdjWLv87zw1dJewoPyXoOrqBRbIvRO2ARf2xZOdwO
         gV5LymoSn0+QZm7khP2fmngBdOZxbTNiREpUkfI59Wm+Hfelk0Yi5rdNrKDlZiaHFnkD
         yPZKcmaRgdjTD3AG5L4QypM0/Zyl7NPaQOUHfjJcgtLXz75QaiJSiBG4aL4XXkE2elsx
         ol9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=0M8malUhXbo8Sfxr7UFbnGsOt+ypggUUrS7tUaBdMwk=;
        b=hQ372YWmKDrnXUFBl0buJweIGaM9P2JVbzPn3w4CTrEAZe4w2EyrKME4CoWv9497z4
         tNvd6FVrVPbMY7Tm0gAs5oALERypVueUrN/wUNKaVUZKz/6MXI+MN9WVlXubU7GKjXKZ
         0qcNnm1KLx1dPHaxTAToVbJn0zk6zS+5oLvf2+g5HP9rN63THHvqSnjB64r0X45INoVb
         meBwwI88u50TW9ra+FHRafHF2ej/2yBf71zQivxQkA8GMSZSizX9eYUYBQl4wBZi58ZZ
         nE9qYFYF6O7LsbX5rdeM+CSnGMxTUlVmpIet8+U4VlUtnxwog4fyduaRvZcAAJOsdkhF
         efUw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gm2B89ZY;
       spf=pass (google.com: domain of alonsosara44@gmail.com designates 2a00:1450:4864:20::62c as permitted sender) smtp.mailfrom=alonsosara44@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0M8malUhXbo8Sfxr7UFbnGsOt+ypggUUrS7tUaBdMwk=;
        b=axUoLfWG1085sjBnWAgqqH6OW6Ng/y4dn1ce0Ub2yTO1I1pCBWwbPB8dZLk9NCAm5J
         z2+ym1lPlmVRq9kG9rnTa2DaYb1b5fPoMocylzBbl/XJNUTde8e0KjN+3H9SbeCgOmDv
         hAOlzQeMyI6W5qrib8FTRCDut+IRjgO7rCUXgDWIl4HzC6noYF7THHV/mpLwd2KD8syy
         YM5i/Cb1mO1SA/CWN/aIroFYH0ULtuTTdo0zaJIykejGhghc+EyCrGrLWfhwJ6QMxfEU
         jN7WmQpeCnWvm901sbggeDIT0NRpVUqiWN7h7EVaeKHgQ8zZI3WoTQKjgbnp6bF97eAq
         2eGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0M8malUhXbo8Sfxr7UFbnGsOt+ypggUUrS7tUaBdMwk=;
        b=MpMehbc3AJROPlbuIXcwNAxSfxwBPYISepIGCgH+y6iEwp3xKCkFTHr88WFny4dR5j
         gSglgBszeiXmuGipbNjW3s8624gwZFSCbabaTw2FU9JxUD66/fhjpduG+tYstuYGiBIr
         agBdnV0IXYQCZD8Kir2ZbGX+fB0udRv0O8M2PJgDfi1OsU1AYFt62QfCbGpv6rBe4Ju7
         jBi7CQPV6RFcSYCrfXSmcw6f5e1ApewvMgljv0Wbr9oMIXrMVb/nGEg2xVTSMndRweQU
         cou4WM/YSFEttCK2Qs0To7HsddyCOZ3DaZ8xJZwFtycaWVKPNCLUJw0N51uYAwEZTmA0
         TEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0M8malUhXbo8Sfxr7UFbnGsOt+ypggUUrS7tUaBdMwk=;
        b=IRx+lkRGIG9Z3PN0K1iphczs4mDdAfU1bdkKZkuVjKKtjYKmfEL2Eta5HCGBw+Ah/6
         dQUowvH9qXraTVwZYzhCLg385mcErLsZCTOrOJvR8Oqv8GS/sx9PuoUrAweYJISRjXOR
         /Dd+/1Jc9T3LltKzrHnpl+AXuexpZzxWk5TUPwlHrs5Mf9Xxu+mT4GWEDmcv1ekAJq+m
         dHrP2wwTRHCFltaPN7SIcQZBGBMQRAImmj3MEPVhJ15KfOFZEErsbtAts/U4qmBi3mix
         YJe7daAf1wlpNypkguW88DWuXY9aaF8fcBuw0Sh0rQgiI7xAV/mWUd/3IWUeGuzsJ7RU
         cWOg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora87VFPPAoUdFQFHrc0m+OQWekTvGj3fHmbdf6DT7p4QhK3Jsg9v
	SoGvrILVMiSbyYHIEZwZkZQ=
X-Google-Smtp-Source: AGRyM1tD32PflqEY0U7TjccA1IzzJzXp+we6Jr2OK6FDLQ0YEy3cW53NpRL8+eP5WXI1BLUXw8BNfA==
X-Received: by 2002:a2e:a793:0:b0:25e:1f13:9953 with SMTP id c19-20020a2ea793000000b0025e1f139953mr914389ljf.177.1659092588837;
        Fri, 29 Jul 2022 04:03:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3506:0:b0:25e:4169:af19 with SMTP id z6-20020a2e3506000000b0025e4169af19ls125788ljz.11.-pod-prod-gmail;
 Fri, 29 Jul 2022 04:03:07 -0700 (PDT)
X-Received: by 2002:a2e:131a:0:b0:25d:68eb:cf6 with SMTP id 26-20020a2e131a000000b0025d68eb0cf6mr863960ljt.267.1659092587132;
        Fri, 29 Jul 2022 04:03:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659092587; cv=none;
        d=google.com; s=arc-20160816;
        b=BzMTjCxtzgf51g1E3zz1b8ljBnM8Hfz9TzBIE+TGy0CO/D4ujv/oFYmfRQ7/weNIw/
         7jYoEo1ZrfCCm7fMzX4vGn/SjWmawcsF/EWqVtLXM5GJkvpurRbxN9nfdNNn/lll1OIx
         jVtbcyh64rmxahV1eXEtQ4k6U0n0AeyBf760kn8ZOJpX+HcomF7T5kkzgrrdo0NtUKh2
         EG7H54p6Oal6Yghu/Ha7TYzC+rr1LQOf14MyRUh9SvtFiCq6i/cQX6EDviWlW1hlYGOP
         FVcFdwS16fWysfZbPcoHT9beLkaaWAsYvaQxeA3m92vZ32MtTQT/1lrQgHzDWcSHkeBg
         gVkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nhY5lun9Yp07emoAUeBoVcYy/maurFDZki/BEgdxrQI=;
        b=DsefxdZWLrHi5dqxH7jvT5sPtRmUSUwAuaM+yMQUT/ob5R38jCPCtL51IslahjPm2t
         wbUeJNcbHcFY0wJgu4NIvcXvPXtimv5KD1hyQ+SlvhMJaxze1JL+YGUlW1YlxTmdixUP
         C0+59Ecd+qCByyeWPWTCGF+I1uPEv0LQYg6xl282etBAl6qhNM7DIxMnQf1Z6B634jQY
         8RVwLU+/gmqOhD1ByNiQ5MTS1Wtz2W9KgM9nbgXRGDRihINVvM7Tqtz8UBmvwlqH/qWj
         lQYkW5e/rfB+JRhGjljIwJX3p+0GLEgKUL2uV0/p6comHmocK0TomFBIknv+5s8trwKP
         slfw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gm2B89ZY;
       spf=pass (google.com: domain of alonsosara44@gmail.com designates 2a00:1450:4864:20::62c as permitted sender) smtp.mailfrom=alonsosara44@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com. [2a00:1450:4864:20::62c])
        by gmr-mx.google.com with ESMTPS id w16-20020a05651234d000b0048acffe11d1si104427lfr.10.2022.07.29.04.03.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Jul 2022 04:03:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of alonsosara44@gmail.com designates 2a00:1450:4864:20::62c as permitted sender) client-ip=2a00:1450:4864:20::62c;
Received: by mail-ej1-x62c.google.com with SMTP id j22so7921993ejs.2
        for <jailhouse-dev@googlegroups.com>; Fri, 29 Jul 2022 04:03:07 -0700 (PDT)
X-Received: by 2002:a17:907:69b0:b0:72b:8e7b:6c2c with SMTP id
 ra48-20020a17090769b000b0072b8e7b6c2cmr2512914ejc.61.1659092586587; Fri, 29
 Jul 2022 04:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <CACD6wFOpQ3ZNBDtPoz+LLS57gxAZ3JuDOi_1orGKqPKiC7s4jA@mail.gmail.com>
 <20220729124412.4f8aecc6@md1za8fc.ad001.siemens.net>
In-Reply-To: <20220729124412.4f8aecc6@md1za8fc.ad001.siemens.net>
From: Sara Alonso <alonsosara44@gmail.com>
Date: Fri, 29 Jul 2022 13:02:55 +0200
Message-ID: <CACD6wFMHN3rqW0sEAAtQMW7ha81Sj20CeLXyGayA5oGR-CJFOA@mail.gmail.com>
Subject: Re: Troubles running jailhouse
To: Henning Schild <henning.schild@siemens.com>
Cc: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="00000000000045eac705e4ef984e"
X-Original-Sender: alonsosara44@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=Gm2B89ZY;       spf=pass
 (google.com: domain of alonsosara44@gmail.com designates 2a00:1450:4864:20::62c
 as permitted sender) smtp.mailfrom=alonsosara44@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--00000000000045eac705e4ef984e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Henning,

Thanks a lot for your help. It worked with insmod. Now I can do *modprobe
jailhouse*, but then, when I do* jailhouse enable /boot/zynqmp-zcu102.cell*
I get this message:* -sh: jailhouse: command not found*. Is there another
step I have to do before, or do you know how I could fix this?

Thank you very much,
Sara

El vie, 29 jul 2022 a las 12:44, Henning Schild (<henning.schild@siemens.co=
m>)
escribi=C3=B3:

> Am Fri, 29 Jul 2022 11:33:32 +0200
> schrieb Sara Alonso <alonsosara44@gmail.com>:
>
> > Hi!
> >
> > I am trying to run jailhouse in a zcu102 board following this
> > tutorial:
> >
> https://github.com/siemens/jailhouse/blob/master/Documentation/setup-on-z=
ynqmp-zcu102.md
> > But I am new at this and I have some troubles.
> >
> > I have built the petalinux-project and also jailhouse.  I have copied
> > into the SD: the image.ub, BOOT.BIN, system.dtb, inmate-zynqmp.dtb,
> > zynqmp-zcu102.cell and zynqmp-zcu102-inmate-demo.cell in the BOOT
> > partition and the rootfs.cpio + the lib and usr files installed when
> > jailhouse is compiled in the ROOT partition. I don't know if
> > something else is required or if something is not needed.
> >
> > The project is running, but if I do "modprobe jailhouse" it says:
> > modprobe: module jailhouse not found in modules.dep
> > I think I have followed all the steps of the tutorial. What could be
> > happening?
>
> Jailhouse uses a kernel module which you have to copy as well. Double
> check that you did. It should be called jailhouse.ko and end up
> somewhere in /lib/modules/<kernel>/extra or something. For "modprobe"
> to work you might have to run "depmod -a" first, otherwise you can also
> "insmod /lib/.../jailhouse.ko" and load it by file instead of by name.
>
> regards,
> Henning
>
> > Thank you very much,
> > Sara
> >
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CACD6wFMHN3rqW0sEAAtQMW7ha81Sj20CeLXyGayA5oGR-CJFOA%40mail.gm=
ail.com.

--00000000000045eac705e4ef984e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Dear Henning,</div><div><br></div><div>Thanks a lot f=
or your help. It worked with insmod. Now I can do <b><i>modprobe jailhouse<=
/i></b>, but then, when I do<i><b> jailhouse enable /boot/zynqmp-zcu102.cel=
l</b></i> I get this message:<i><b> -sh: jailhouse: command not found</b></=
i>. Is there another step I have to do before, or do you know how I could f=
ix this?</div><div><br></div><div>Thank you very much,</div><div>Sara<br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">El vie, 29 jul 2022 a las 12:44, Henning Schild (&lt;<a href=3D"mailto:=
henning.schild@siemens.com">henning.schild@siemens.com</a>&gt;) escribi=C3=
=B3:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Am Fri, 29 =
Jul 2022 11:33:32 +0200<br>
schrieb Sara Alonso &lt;<a href=3D"mailto:alonsosara44@gmail.com" target=3D=
"_blank">alonsosara44@gmail.com</a>&gt;:<br>
<br>
&gt; Hi!<br>
&gt; <br>
&gt; I am trying to run jailhouse in a zcu102 board following this<br>
&gt; tutorial:<br>
&gt; <a href=3D"https://github.com/siemens/jailhouse/blob/master/Documentat=
ion/setup-on-zynqmp-zcu102.md" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/siemens/jailhouse/blob/master/Documentation/setup-on-zynqmp-zcu=
102.md</a><br>
&gt; But I am new at this and I have some troubles.<br>
&gt; <br>
&gt; I have built the petalinux-project and also jailhouse.=C2=A0 I have co=
pied<br>
&gt; into the SD: the image.ub, BOOT.BIN, system.dtb, inmate-zynqmp.dtb,<br=
>
&gt; zynqmp-zcu102.cell and zynqmp-zcu102-inmate-demo.cell in the BOOT<br>
&gt; partition and the rootfs.cpio + the lib and usr files installed when<b=
r>
&gt; jailhouse is compiled in the ROOT partition. I don&#39;t know if<br>
&gt; something else is required or if something is not needed.<br>
&gt; <br>
&gt; The project is running, but if I do &quot;modprobe jailhouse&quot; it =
says:<br>
&gt; modprobe: module jailhouse not found in modules.dep<br>
&gt; I think I have followed all the steps of the tutorial. What could be<b=
r>
&gt; happening?<br>
<br>
Jailhouse uses a kernel module which you have to copy as well. Double<br>
check that you did. It should be called jailhouse.ko and end up<br>
somewhere in /lib/modules/&lt;kernel&gt;/extra or something. For &quot;modp=
robe&quot;<br>
to work you might have to run &quot;depmod -a&quot; first, otherwise you ca=
n also<br>
&quot;insmod /lib/.../jailhouse.ko&quot; and load it by file instead of by =
name.<br>
<br>
regards,<br>
Henning<br>
<br>
&gt; Thank you very much,<br>
&gt; Sara<br>
&gt; <br>
<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CACD6wFMHN3rqW0sEAAtQMW7ha81Sj20CeLXyGayA5oGR-CJFO=
A%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CACD6wFMHN3rqW0sEAAtQMW7ha81Sj20CeLXyGayA5o=
GR-CJFOA%40mail.gmail.com</a>.<br />

--00000000000045eac705e4ef984e--
