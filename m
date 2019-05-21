Return-Path: <jailhouse-dev+bncBDK73PWO4MPBBM7RSDTQKGQEQQJW63A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id BF849256E7
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 19:43:15 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id z15sf3287370ljj.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 10:43:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558460595; cv=pass;
        d=google.com; s=arc-20160816;
        b=IFhtZguiach+9JIG7W2MKaXPg7Q+A5l2e3U+WOV50xHW22E4t0Fy9sXDkKTBpKMsoV
         8bA1kzOIiqfEtzOJ0C06kqYc5yCiR9kLjm/sL1wgGXEnoTmTWf49/zeh/Upb7G/1MpE9
         T9xGp4zCR3j0L+UUvfDupWvprtr3R2jxFziYtuhSVmlVlVqumcL8IYu2br2c7HcNZXPg
         /Or3jxQzft01vieMeityqR5+mqJYV728u5UU6UKAjRpfVMMFYwXbehPPl6FCXqmmPp8U
         3AcfrMMFKNTOfH1oJMIMPjJaEMqkyJhgC0Jwf2I2OQVX5/xz5EPbow6BBpRbkVgXEUkG
         e3Rg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=aTijTNLHPLRmlgghGUrwNUvAkZYXc4sfZPwnmE4NfjU=;
        b=pr8VPMNdC7CgyxgTDG8HXdAZppxG4O1wRbwKUS9SjyImRJwGqT8T6iKsMFi2r1GKJk
         HXq7N7V0k5yYPVohdOoS0oKVIanJJMzAGygCMuvc5kwuOI92end83nMO/lbj7jSSEu6M
         +h/xc4YdWEQdyrILesg83UIewRR5HNcE3wP3MuZU/eNjG+zAFQz6SRbCBQ/zkXUO6BBW
         vbmStEK4RgsbE14YB5q3W4o+16svdC8ktpGiWxGguFcR0zeN2BGtDO11PyuC7SjCHLaO
         HlRu4q4c8dipcRa4izJwSXaPLvjuxSu1HWeg9F4sei0UfZZ4jXhn96vxPmukscFiRnWT
         I8nw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=WaE1ugVY;
       spf=pass (google.com: domain of yassershalabi@gmail.com designates 2a00:1450:4864:20::52c as permitted sender) smtp.mailfrom=yassershalabi@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aTijTNLHPLRmlgghGUrwNUvAkZYXc4sfZPwnmE4NfjU=;
        b=JYyofCHC9U05IbNRpSQFRkH5PiOi/h/JouOYhbua2u7NZnuuoz8ut0rK/gKBidj8UU
         5k+OKSEo2h+e2aIwVZo4KoOoAgyg4chzd98+OhKMV1eAECYHjuvzYOWZAyVStA2ymvAP
         O9D9NWcrNC4r9xJOaEh0uhogzkfzGRxVA2SNfa+rONRqBhW3dp363KIP+M6Nijfj8/sj
         3w3kmhhC+1PHlFqoE2GZVB3+5lhni2QkAZabmD1idA96BhACR8jevtdnozY27tINSOfb
         xgcIP/ZWM3RyhaPtPLBW4n+yYiTEO1xvzYT882zblU3k6Hl3LRkRsPUsmVxq5Y/cJwPt
         q7Tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aTijTNLHPLRmlgghGUrwNUvAkZYXc4sfZPwnmE4NfjU=;
        b=Bgcsfhc7ZzvbEX53WoAY6Zq01ErUQHpKqgrr0nJYKUXzH/vvzhy/Xs2YDkJMSNL6nm
         AFpCcm3OML/qJcO2XxJuVGUWnKvAEfbnw5u+aB2qo6tvGPJrD1fxmfaVE6f+uIGnJaWd
         AOinlEMGMd47K8v0PDCNjsxoRGiltBv5j7yElc0tQ2WGR/oBz/cE0Oqbw81RJ9S1MUml
         ba08orw8CFVwQbQiXSBCrWFNp391SWnrhjykns3Lbjo/X+W1OI6rAGVU9aLhAbB6kOB2
         IOcyJstMXzTfImK6BaSfnWrlx+4P2yDAyA6VRdyegl5/eMa8hR3yhsv2I0REzGr0rtE2
         qksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aTijTNLHPLRmlgghGUrwNUvAkZYXc4sfZPwnmE4NfjU=;
        b=MjUwpadY0evbFyTCc7+XO2a6eErnA/ZsmmVmKadIpc8oFEVCladmwPlyJMiq71keCQ
         zwig6YM6Cpfk6/og9HLTIS/9V9eRiRr2M105ibcybDCa9hdOy2lyagV6F+3A0rGtcpgE
         jlzXif+k2FE8NLMI5pZgmIWHL8dyajYlP/rytcyuDQdlK5ZJGxvPl8bfZklzc89m3zgy
         nk3oT1mXqVm2xDd7i4zs0IcJjOTS1yS0a1REvd07qiO2OklNvOQMo/1I2HzW3AZn6lTt
         8Ivo+E53xo4StDPlb0t1wqEa7u5bd1lmcK7MgZchLaTiPMmCNyjECQeZwGf4Q408gpHl
         uEjg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXnsZy3UcCTbUAjwr5k70CzWdBchEyr2wUTWmS5GaJRpuqsfWIP
	XBmPA1BIRy8YzXjT8zQFAnU=
X-Google-Smtp-Source: APXvYqx1wlSOujKUh1iIFjd27XAG+SbafTcRM44t0P0IMLOfoGjhlpd4VWnBQ+1Zb+briT+Uya2HdA==
X-Received: by 2002:a2e:9c09:: with SMTP id s9mr13927548lji.74.1558460595327;
        Tue, 21 May 2019 10:43:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:494a:: with SMTP id b10ls2395374ljd.8.gmail; Tue, 21 May
 2019 10:43:14 -0700 (PDT)
X-Received: by 2002:a2e:9692:: with SMTP id q18mr4036057lji.89.1558460594794;
        Tue, 21 May 2019 10:43:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558460594; cv=none;
        d=google.com; s=arc-20160816;
        b=SXelJdiTks811qHBu2eel3mmSsT5mN97Nv3I/26vGL+tZCpSdRH2q1CySKVOD2OgU1
         sFqdRkL/dLJTRQdWQu2QFls9UPQIoHo32Ah3qAPuxTFy3yoqzVXAJvZELTDK8/scfE96
         HT4cp/b6IbhNrUcXLo4Heivr05/qnCqff5ajF6LUiZce0utFbwxzhe8s8BfrC/aQ5Y3a
         sPfJBZuqWZ3/snuQkEoK+FlS82xFjdPdLZsDthfteSWed/wFgRJR1HNLJ2OyvHpTbzHC
         MPLDgnyfcmvxgpUsYbdryjImlzsfDVj8OtpockRYM9ufDia+fd0I5TfFkhSEOvTZInMA
         JF9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0F4q6SmsIfbTXptJVgpJ6KjYznURhUT9J6P3BAofiTY=;
        b=jjDMaRnanY/ainz9gniTpzQ91+2LNgKl2dihT4WwlaCeJ0T0Kap6QU3X2CVr80OuTc
         ZVxYsiEzbALIbSZwVvo2YrEE7fjCk+luRrSDaWE+jn021qzoe5A8pyYfj9A+jvXoy5iO
         IJXoQw/002AHN7o2Tmrjw77uoW4V/Un7ZzO5kwqc40GVHDDRol+Q2Z1f3fanAXfrkD0A
         7ZvFFQmlqwjokgHfR3veH7jqcYnd9ngxQKSmHcOiZnRjjPn8OqI+hw9oDVhI7ER1YcnG
         O8WAxgrl3tT1eTcSiu7caKBqT8y8VGSrSclTSCfw2vMumv9g3W4d7qNoxotoHbtCW9mY
         7TVw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=WaE1ugVY;
       spf=pass (google.com: domain of yassershalabi@gmail.com designates 2a00:1450:4864:20::52c as permitted sender) smtp.mailfrom=yassershalabi@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com. [2a00:1450:4864:20::52c])
        by gmr-mx.google.com with ESMTPS id s187si1844231lfe.4.2019.05.21.10.43.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 10:43:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of yassershalabi@gmail.com designates 2a00:1450:4864:20::52c as permitted sender) client-ip=2a00:1450:4864:20::52c;
Received: by mail-ed1-x52c.google.com with SMTP id j12so30618459eds.7
        for <jailhouse-dev@googlegroups.com>; Tue, 21 May 2019 10:43:14 -0700 (PDT)
X-Received: by 2002:aa7:d28e:: with SMTP id w14mr85201440edq.119.1558460594029;
 Tue, 21 May 2019 10:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <4eb2d565-fa3a-4742-435b-d4fa1469c60f@oth-regensburg.de>
 <fd82641f-4f35-3674-af69-68fb41624fd8@siemens.com> <db894a08-8c3a-cb64-2c84-ac595f02b6e0@oth-regensburg.de>
 <339bf164-d7b1-f9ef-2023-b6fbb9d5c098@siemens.com> <6a8fecef-27d7-b300-4a14-e874f459ea4b@oth-regensburg.de>
In-Reply-To: <6a8fecef-27d7-b300-4a14-e874f459ea4b@oth-regensburg.de>
From: Yasser Shalabi <yassershalabi@gmail.com>
Date: Tue, 21 May 2019 12:43:02 -0500
Message-ID: <CACkfA5tm2H-LeU0MnQWM0TZGOOoeSjuAY8FeRNRODQCceJr-8A@mail.gmail.com>
Subject: Re: VT-d: IOMMU exception with unknown fault reason
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Mario Mintel <mario.mintel@st.oth-regensburg.de>
Content-Type: multipart/alternative; boundary="0000000000001a88dd05896962f3"
X-Original-Sender: yassershalabi@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=WaE1ugVY;       spf=pass
 (google.com: domain of yassershalabi@gmail.com designates 2a00:1450:4864:20::52c
 as permitted sender) smtp.mailfrom=yassershalabi@gmail.com;       dmarc=pass
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

--0000000000001a88dd05896962f3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yeah, sorry been caught up and lost track of doing this. Will do it ASAP.

I=E2=80=99ll will also try to add some code to dynamically determine PKE su=
pport to
avoid setting it for older platforms (Jan previously requested this).

Thanks for the reminder.

Yasser

On Tue, May 21, 2019 at 12:38 PM Ralf Ramsauer <
ralf.ramsauer@oth-regensburg.de> wrote:

> Hi Yasser,
>
> I hit the same CR4 PKE-bit case as you did a month ago.
>
> May I ask you to resend the patch (with a Signed-Off line) to the
> mailing list?
>
> Thanks
>   Ralf
>
> On 5/21/19 6:38 PM, Jan Kiszka wrote:
> > On 21.05.19 17:55, Ralf Ramsauer wrote:
> >>
> >>
> >> On 5/21/19 5:09 PM, Jan Kiszka wrote:
> >>> On 21.05.19 15:45, Ralf Ramsauer wrote:
> >>>> Hi,
> >>>>
> >>>> we have some issues enabling Jailhouse on a Intel with a pretty new
> CPU
> >>>> (Xeon Gold 5118).
> >>>>
> >>>> First, the CPU supports PKE and Linux will enable it (CR4, Bit 22).
> >>>> Jailhouse won't start, as this bit is marked in X86_CR4_RESERVED.
> >>>> Didn't
> >>>> have a deeper look into this on how it affects the hypervisor or
> >>>> allowing it needs some special treatment, so adding nopku to the
> >>>> commandline will keep the feature disabled and suffices for the
> moment.
> >>>>
> >>>
> >>> Known issue, see https://github.com/siemens/jailhouse/pull/23
> >>
> >> Aah, I remember that discussion a month ago...
> >>
> >> So I guess it is okay to allow this feature.
> >>
> >> What would you say, is it better to use a configuration parameter that
> >> indicates the existence of PKE (as noted in the github discussion, we
> >> should only respect that bit if available), or online cpuid discovery?
> >>
> >> I guess the latter one is a bit against the philosophy, but much simpl=
er
> >> to implement.
> >>
> >
> > Checking the code again and the comment I wrote around it, my remark in
> > github that we would need discovery was actually overkill: The whole
> > purpose of X86_CR4_RESERVED is to filter out future unknown bits. But
> > CR4.PKE is no longer unknown, and it is apparently safe to allow it to
> > the root cell. IOW, that commit was fine (if it had been submitted with
> > signed-off here).
> >
> > Jan
> >
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CACkfA5tm2H-LeU0MnQWM0TZGOOoeSjuAY8FeRNRODQCceJr-8A%40mail.gm=
ail.com.
For more options, visit https://groups.google.com/d/optout.

--0000000000001a88dd05896962f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Yeah, sorry been caught up and lost track of doing t=
his. Will do it ASAP.=C2=A0</div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I=E2=80=99ll will also try to add some code to dynamically determ=
ine PKE support to avoid setting it for older platforms (Jan previously req=
uested this).</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks for=
 the reminder.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Yasser</d=
iv><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, May 21, 2019 at 12:38 PM Ralf Ramsauer &lt;<a href=3D"mailto:ralf=
.ramsauer@oth-regensburg.de">ralf.ramsauer@oth-regensburg.de</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Hi Yasser,<br>
<br>
I hit the same CR4 PKE-bit case as you did a month ago.<br>
<br>
May I ask you to resend the patch (with a Signed-Off line) to the<br>
mailing list?<br>
<br>
Thanks<br>
=C2=A0 Ralf<br>
<br>
On 5/21/19 6:38 PM, Jan Kiszka wrote:<br>
&gt; On 21.05.19 17:55, Ralf Ramsauer wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On 5/21/19 5:09 PM, Jan Kiszka wrote:<br>
&gt;&gt;&gt; On 21.05.19 15:45, Ralf Ramsauer wrote:<br>
&gt;&gt;&gt;&gt; Hi,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; we have some issues enabling Jailhouse on a Intel with a p=
retty new CPU<br>
&gt;&gt;&gt;&gt; (Xeon Gold 5118).<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; First, the CPU supports PKE and Linux will enable it (CR4,=
 Bit 22).<br>
&gt;&gt;&gt;&gt; Jailhouse won&#39;t start, as this bit is marked in X86_CR=
4_RESERVED.<br>
&gt;&gt;&gt;&gt; Didn&#39;t<br>
&gt;&gt;&gt;&gt; have a deeper look into this on how it affects the hypervi=
sor or<br>
&gt;&gt;&gt;&gt; allowing it needs some special treatment, so adding nopku =
to the<br>
&gt;&gt;&gt;&gt; commandline will keep the feature disabled and suffices fo=
r the moment.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Known issue, see <a href=3D"https://github.com/siemens/jailhou=
se/pull/23" rel=3D"noreferrer" target=3D"_blank">https://github.com/siemens=
/jailhouse/pull/23</a><br>
&gt;&gt;<br>
&gt;&gt; Aah, I remember that discussion a month ago...<br>
&gt;&gt;<br>
&gt;&gt; So I guess it is okay to allow this feature.<br>
&gt;&gt;<br>
&gt;&gt; What would you say, is it better to use a configuration parameter =
that<br>
&gt;&gt; indicates the existence of PKE (as noted in the github discussion,=
 we<br>
&gt;&gt; should only respect that bit if available), or online cpuid discov=
ery?<br>
&gt;&gt;<br>
&gt;&gt; I guess the latter one is a bit against the philosophy, but much s=
impler<br>
&gt;&gt; to implement.<br>
&gt;&gt;<br>
&gt; <br>
&gt; Checking the code again and the comment I wrote around it, my remark i=
n<br>
&gt; github that we would need discovery was actually overkill: The whole<b=
r>
&gt; purpose of X86_CR4_RESERVED is to filter out future unknown bits. But<=
br>
&gt; CR4.PKE is no longer unknown, and it is apparently safe to allow it to=
<br>
&gt; the root cell. IOW, that commit was fine (if it had been submitted wit=
h<br>
&gt; signed-off here).<br>
&gt; <br>
&gt; Jan<br>
&gt; <br>
</blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CACkfA5tm2H-LeU0MnQWM0TZGOOoeSjuAY8FeRNRODQCceJr-8=
A%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CACkfA5tm2H-LeU0MnQWM0TZGOOoeSjuAY8FeRNRODQ=
CceJr-8A%40mail.gmail.com</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--0000000000001a88dd05896962f3--
