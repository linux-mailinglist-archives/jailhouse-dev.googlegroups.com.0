Return-Path: <jailhouse-dev+bncBDK73PWO4MPBBOX7SDTQKGQED4JUFVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E9525751
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 20:13:15 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id u11sf8430522wri.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 11:13:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558462395; cv=pass;
        d=google.com; s=arc-20160816;
        b=OWmdRC7SMWpx7RfwqHTZ8Kp3VfsU8nJrNVIfD5BhA/Q8k6xuNKFryvHFcrWOWE+uL2
         E83TISCSynAyE8Q/uPvyUFRkkuF2sUMCFXOqlvR7czJ/JArntQQ85Lv4Rsu28BIbw7tM
         6pWCTiE621YTf44Ib7rpd53rlUcUVJzqswLOAQm3WTAIQwLweeo9SFTt+Cm7OUHxSBoI
         CttURn2EvA1R54kHBVOSsfvZMW/vifjUwnFhqvaIbFhYyHRIB8bw7T2N5C77ohwR84Sz
         i7oU6xYlyzROHJBP4ndr3Pa/Z8OnXYtAuOLzts/zJoD7gaJYS+kaqrtb8lYoB0SLDQCp
         uNHA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=e0vkZnYE7G+/bG4RPbSG1i/UXQmV6t4l8EpH+N7OwMM=;
        b=qlF8vaM1H2NIQpCKFAIySl0Jmu725mtGCCCIC8ZCTDfl71nmlGzl2ZqT4iYOYFNEte
         cd7g3pBCqyJZCKfu2GZosW2COP8ZpGTDd1Jrw2ayt2NgNdI8TsJ418Lk/rFkMv2sF3gG
         l6cF8kbahdp9k2UU8t+3vSinLMtDMxbVNIiemk2LY57AOR4eRnxLFnv7XBrd4xwoBOyp
         J9WX9kJUdb7F2UVpZZlSANpvUiwO2HLOw0kZh7HkJhj+PzikeCp/tZetB9F/ptZoouV6
         tyJr5CGPj8N5o5mSKXlcdTGmAVzouJ8sCch2+QTkagPige2LI0QHORGORBM8s/XYbf1z
         MHEQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=OtgVhcb0;
       spf=pass (google.com: domain of yassershalabi@gmail.com designates 2a00:1450:4864:20::530 as permitted sender) smtp.mailfrom=yassershalabi@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=e0vkZnYE7G+/bG4RPbSG1i/UXQmV6t4l8EpH+N7OwMM=;
        b=YJ7xNuTsSlGSpGvZyZcc/ISxg6lzVYo19cxMliWD3Hme+Du3j04VI9ZQb14cEi9/WQ
         oJyFfMCmMzdIcdxc1MxebdpK3CKrAJStVTSpnLPkYbg71lUwzk9nBUVudXnKliOhNeGs
         vXtMyNiygXZNqQsg7jcHHSYqTlbar0H1nUZ4JoUxplcnQscDu98beW+XB7fmT9VKPveg
         cuaha4cRRrYWbGyp3GPnHf3tGKwq2WufhGGkWukNhhu/i3Y+WWF+nQOcDyQdD9p92j04
         8gWmAwms7S0ecGkDt3IaV3hN7hwq2fmBi3F1Uh5n9t0FVUHcIShcSyD8PK3dcbvgQbfg
         xKpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=e0vkZnYE7G+/bG4RPbSG1i/UXQmV6t4l8EpH+N7OwMM=;
        b=VmcCBHMde48ei0a4SprhVfrOkHQpE/+jGtn+cjv0aDpPQ56J0ZUMJmIpBQYPxqk3ze
         4ZVu7faWQzQB5Uztw9F6Pt0xrWiDdph7iFSIpgYbTFJau5OF5NPZdYJ+XY4b4LWgN2h5
         zGruGcq+Xlj5nAQ6br/SwnRgvisPjTUhyyilDvmaFWG8r4IFDdczm4mNf/31+sERFwxb
         JMxwhRS3QVNmA8G81byDZbYu3q/Dps7Vu/KoJ3Bt0MGTwAcCCkqOECa8ps66hbbDgHRa
         IVBreLlh+GZh5ZwSYXbUa5TZ+TZ/+OdShGFNK6VJHKVc2QuyAFU1FEdR2UB54OiujMsw
         BsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=e0vkZnYE7G+/bG4RPbSG1i/UXQmV6t4l8EpH+N7OwMM=;
        b=t606unSFhsxkEcDQLkYTFrGtEZw3uPOG8/I7T9GFfG1MsNhT4zBhNS040rR0vM1i9n
         cGEL7ztwQM5HjoM0lygtZw111qFLHMG1mJjvDiTWxuMU25YdaLr2pvukq1sSXxW/w56F
         bRlQ4QaUvmEX564puR6eEVkzzYHuLy+L6P5+nQI64A2Lg1ws3qj/eGUcK2CWR9wNIrWi
         79du2DSGLmHlSAe6jaBZO9YCdajUlQ/cuGWVVkqhhLzGt6lbv/o1s6jfkY7Jwwfq3Ybx
         uAx+FiAuWQI9kuxHwnR9DGS11n3A6rc4YU48/VhTVOiUx6YxUwqvJ+qYquEHJ49Txg/i
         6KlQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUDI2ZjOOPqUC4bRtEsJqLPAeGUcLSDbgTU4QXAOODlFjcPIWaf
	//eTMi2xrZvBxIybf4aXgvQ=
X-Google-Smtp-Source: APXvYqxeWzI8YRkkXGqVdHfPrCtqGx762dq403rJo2Mvp5LA4n3ACCDAGKS6EF7WLuLwODkhtGixFQ==
X-Received: by 2002:a5d:484f:: with SMTP id n15mr34769120wrs.314.1558462395056;
        Tue, 21 May 2019 11:13:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:c18b:: with SMTP id x11ls5297683wre.15.gmail; Tue, 21
 May 2019 11:13:14 -0700 (PDT)
X-Received: by 2002:adf:f1c3:: with SMTP id z3mr17673864wro.263.1558462394594;
        Tue, 21 May 2019 11:13:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558462394; cv=none;
        d=google.com; s=arc-20160816;
        b=Hwcbvq08aj79Ka6HQtIXEancAaw+6uphdUiy31K+nBUj/EzmF+xlfh0RF/1hd+5RgB
         AQ61LeIw9TWCBo6TrCi+GFnfGcj4SoztlAhKE4Qcd+C3dN1m99gKlX0EstuinjYjhRGC
         61AIno7bIWPPVICJP1X4CkrT3JiZMEFs7pozGI2t4tTpBnUZshAjWTr+kofa2xIVtbPg
         8GEskeX05GQX4gW8XcscSciZfg/DFXC/HuBp6ZKDxjpq9NMqX+JQyV1LejHwMh/nzdnr
         LSODFmJBj/mimG4yP9UHoSMiUWBeUTuNiSs1v1S2Cn4SbmFHVKwyA1v4EvOmXV+EILti
         NpWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iSWzLt5xn7KL8f0ZeP+3YI+jt+7XQ4W3B6U6gAhpASU=;
        b=IRelEjR3W+ApeF6rUx1oWKD2/KnlMCPIxUP5o5vudkyQeQyHZwTrjlCbL+uDfVZmSN
         cSYCyxIc8Qk8mXMnVSDDkvkLED7fuUlPIiOhKpp5bKrx3c0ro7AzfGDyjGk6bpAUbmGs
         jkz6ESwanS8PWEZJOfwZy2PCLJcx9qWjn1rD7kzVigY2BY+mrj2hqXctZLwx+4ycMQRS
         0cEkopUSuPXXft33gAm6l6iDmavEl9shVsLfR0YyC1lkDO6rPXbizIcDtyMV/A8AO2X5
         YGMXbszFgUxrY15CAPcb5OtrOlVgTTvPaGipAy/3llkFfBGgdYZhfa7J+MUUBXqTPYMA
         KO5A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=OtgVhcb0;
       spf=pass (google.com: domain of yassershalabi@gmail.com designates 2a00:1450:4864:20::530 as permitted sender) smtp.mailfrom=yassershalabi@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com. [2a00:1450:4864:20::530])
        by gmr-mx.google.com with ESMTPS id f83si159858wme.2.2019.05.21.11.13.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 11:13:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of yassershalabi@gmail.com designates 2a00:1450:4864:20::530 as permitted sender) client-ip=2a00:1450:4864:20::530;
Received: by mail-ed1-x530.google.com with SMTP id p27so30787182eda.1
        for <jailhouse-dev@googlegroups.com>; Tue, 21 May 2019 11:13:14 -0700 (PDT)
X-Received: by 2002:aa7:d9cb:: with SMTP id v11mr84228040eds.159.1558462394262;
 Tue, 21 May 2019 11:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <4eb2d565-fa3a-4742-435b-d4fa1469c60f@oth-regensburg.de>
 <fd82641f-4f35-3674-af69-68fb41624fd8@siemens.com> <db894a08-8c3a-cb64-2c84-ac595f02b6e0@oth-regensburg.de>
 <339bf164-d7b1-f9ef-2023-b6fbb9d5c098@siemens.com> <6a8fecef-27d7-b300-4a14-e874f459ea4b@oth-regensburg.de>
 <CACkfA5tm2H-LeU0MnQWM0TZGOOoeSjuAY8FeRNRODQCceJr-8A@mail.gmail.com> <909bd5cb-de56-4cc7-c435-303893ef22d6@oth-regensburg.de>
In-Reply-To: <909bd5cb-de56-4cc7-c435-303893ef22d6@oth-regensburg.de>
From: Yasser Shalabi <yassershalabi@gmail.com>
Date: Tue, 21 May 2019 13:13:03 -0500
Message-ID: <CACkfA5t=YfZzQBoY2Ci7201e6uJwA-_3fy9p_DjBSQYhBNnBqQ@mail.gmail.com>
Subject: Re: VT-d: IOMMU exception with unknown fault reason
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Mario Mintel <mario.mintel@st.oth-regensburg.de>
Content-Type: multipart/alternative; boundary="00000000000067ea65058969cd87"
X-Original-Sender: yassershalabi@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=OtgVhcb0;       spf=pass
 (google.com: domain of yassershalabi@gmail.com designates 2a00:1450:4864:20::530
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

--00000000000067ea65058969cd87
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yeah that makes sense. It=E2=80=99s no longer considered reserved =E2=80=94=
 even for older
platforms. I submitted the patch.

Thanks,
Yasser

On Tue, May 21, 2019 at 12:45 PM Ralf Ramsauer <
ralf.ramsauer@oth-regensburg.de> wrote:

> Hi,
>
> On 5/21/19 7:43 PM, Yasser Shalabi wrote:
> > Yeah, sorry been caught up and lost track of doing this. Will do it
> ASAP.
> >
> > I=E2=80=99ll will also try to add some code to dynamically determine PK=
E support
> > to avoid setting it for older platforms (Jan previously requested this)=
.
>
> in Jan's last mail, he wrote that your original patch is fine:
>
> > Checking the code again and the comment I wrote around it, my
> > remark in github that we would need discovery was actually overkill:
> > The whole purpose of X86_CR4_RESERVED is to filter out future unknown
> > bits. But CR4.PKE is no longer unknown, and it is apparently safe to
> > allow it to the root cell. IOW, that commit was fine (if it had been
> > submitted
>
>   Ralf
>
> >
> > Thanks for the reminder.
> >
> > Yasser
> >
> > On Tue, May 21, 2019 at 12:38 PM Ralf Ramsauer
> > <ralf.ramsauer@oth-regensburg.de
> > <mailto:ralf.ramsauer@oth-regensburg.de>> wrote:
> >
> >     Hi Yasser,
> >
> >     I hit the same CR4 PKE-bit case as you did a month ago.
> >
> >     May I ask you to resend the patch (with a Signed-Off line) to the
> >     mailing list?
> >
> >     Thanks
> >       Ralf
> >
> >     On 5/21/19 6:38 PM, Jan Kiszka wrote:
> >     > On 21.05.19 17:55, Ralf Ramsauer wrote:
> >     >>
> >     >>
> >     >> On 5/21/19 5:09 PM, Jan Kiszka wrote:
> >     >>> On 21.05.19 15:45, Ralf Ramsauer wrote:
> >     >>>> Hi,
> >     >>>>
> >     >>>> we have some issues enabling Jailhouse on a Intel with a prett=
y
> >     new CPU
> >     >>>> (Xeon Gold 5118).
> >     >>>>
> >     >>>> First, the CPU supports PKE and Linux will enable it (CR4, Bit
> 22).
> >     >>>> Jailhouse won't start, as this bit is marked in
> X86_CR4_RESERVED.
> >     >>>> Didn't
> >     >>>> have a deeper look into this on how it affects the hypervisor =
or
> >     >>>> allowing it needs some special treatment, so adding nopku to t=
he
> >     >>>> commandline will keep the feature disabled and suffices for th=
e
> >     moment.
> >     >>>>
> >     >>>
> >     >>> Known issue, see https://github.com/siemens/jailhouse/pull/23
> >     >>
> >     >> Aah, I remember that discussion a month ago...
> >     >>
> >     >> So I guess it is okay to allow this feature.
> >     >>
> >     >> What would you say, is it better to use a configuration paramete=
r
> >     that
> >     >> indicates the existence of PKE (as noted in the github
> discussion, we
> >     >> should only respect that bit if available), or online cpuid
> >     discovery?
> >     >>
> >     >> I guess the latter one is a bit against the philosophy, but much
> >     simpler
> >     >> to implement.
> >     >>
> >     >
> >     > Checking the code again and the comment I wrote around it, my
> >     remark in
> >     > github that we would need discovery was actually overkill: The
> whole
> >     > purpose of X86_CR4_RESERVED is to filter out future unknown bits.
> But
> >     > CR4.PKE is no longer unknown, and it is apparently safe to allow
> it to
> >     > the root cell. IOW, that commit was fine (if it had been submitte=
d
> >     with
> >     > signed-off here).
> >     >
> >     > Jan
> >     >
> >
> > --
> > You received this message because you are subscribed to the Google
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send
> > an email to jailhouse-dev+unsubscribe@googlegroups.com
> > <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> > To view this discussion on the web visit
> >
> https://groups.google.com/d/msgid/jailhouse-dev/CACkfA5tm2H-LeU0MnQWM0TZG=
OOoeSjuAY8FeRNRODQCceJr-8A%40mail.gmail.com
> > <
> https://groups.google.com/d/msgid/jailhouse-dev/CACkfA5tm2H-LeU0MnQWM0TZG=
OOoeSjuAY8FeRNRODQCceJr-8A%40mail.gmail.com?utm_medium=3Demail&utm_source=
=3Dfooter
> >.
> > For more options, visit https://groups.google.com/d/optout.
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CACkfA5t%3DYfZzQBoY2Ci7201e6uJwA-_3fy9p_DjBSQYhBNnBqQ%40mail.=
gmail.com.
For more options, visit https://groups.google.com/d/optout.

--00000000000067ea65058969cd87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Yeah that makes sense. It=E2=80=99s no longer consid=
ered reserved =E2=80=94 even for older platforms. I submitted the patch.</d=
iv></div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div di=
r=3D"auto">Yasser</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, May 21, 2019 at 12:45 PM Ralf Ramsauer &lt;<a=
 href=3D"mailto:ralf.ramsauer@oth-regensburg.de">ralf.ramsauer@oth-regensbu=
rg.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
<br>
On 5/21/19 7:43 PM, Yasser Shalabi wrote:<br>
&gt; Yeah, sorry been caught up and lost track of doing this. Will do it AS=
AP.=C2=A0<br>
&gt; <br>
&gt; I=E2=80=99ll will also try to add some code to dynamically determine P=
KE support<br>
&gt; to avoid setting it for older platforms (Jan previously requested this=
).<br>
<br>
in Jan&#39;s last mail, he wrote that your original patch is fine:<br>
<br>
&gt; Checking the code again and the comment I wrote around it, my<br>
&gt; remark in github that we would need discovery was actually overkill:<b=
r>
&gt; The whole purpose of X86_CR4_RESERVED is to filter out future unknown<=
br>
&gt; bits. But CR4.PKE is no longer unknown, and it is apparently safe to<b=
r>
&gt; allow it to the root cell. IOW, that commit was fine (if it had been<b=
r>
&gt; submitted<br>
<br>
=C2=A0 Ralf<br>
<br>
&gt; <br>
&gt; Thanks for the reminder.<br>
&gt; <br>
&gt; Yasser<br>
&gt; <br>
&gt; On Tue, May 21, 2019 at 12:38 PM Ralf Ramsauer<br>
&gt; &lt;<a href=3D"mailto:ralf.ramsauer@oth-regensburg.de" target=3D"_blan=
k">ralf.ramsauer@oth-regensburg.de</a><br>
&gt; &lt;mailto:<a href=3D"mailto:ralf.ramsauer@oth-regensburg.de" target=
=3D"_blank">ralf.ramsauer@oth-regensburg.de</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi Yasser,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I hit the same CR4 PKE-bit case as you did a month =
ago.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0May I ask you to resend the patch (with a Signed-Of=
f line) to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0mailing list?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 Ralf<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 5/21/19 6:38 PM, Jan Kiszka wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On 21.05.19 17:55, Ralf Ramsauer wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; On 5/21/19 5:09 PM, Jan Kiszka wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; On 21.05.19 15:45, Ralf Ramsauer wrote=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; Hi,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; we have some issues enabling Jailh=
ouse on a Intel with a pretty<br>
&gt;=C2=A0 =C2=A0 =C2=A0new CPU<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; (Xeon Gold 5118).<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; First, the CPU supports PKE and Li=
nux will enable it (CR4, Bit 22).<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; Jailhouse won&#39;t start, as this=
 bit is marked in X86_CR4_RESERVED.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; Didn&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; have a deeper look into this on ho=
w it affects the hypervisor or<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; allowing it needs some special tre=
atment, so adding nopku to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; commandline will keep the feature =
disabled and suffices for the<br>
&gt;=C2=A0 =C2=A0 =C2=A0moment.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; Known issue, see <a href=3D"https://gi=
thub.com/siemens/jailhouse/pull/23" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/siemens/jailhouse/pull/23</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Aah, I remember that discussion a month ag=
o...<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; So I guess it is okay to allow this featur=
e.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; What would you say, is it better to use a =
configuration parameter<br>
&gt;=C2=A0 =C2=A0 =C2=A0that<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; indicates the existence of PKE (as noted i=
n the github discussion, we<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; should only respect that bit if available)=
, or online cpuid<br>
&gt;=C2=A0 =C2=A0 =C2=A0discovery?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; I guess the latter one is a bit against th=
e philosophy, but much<br>
&gt;=C2=A0 =C2=A0 =C2=A0simpler<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; to implement.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Checking the code again and the comment I wrot=
e around it, my<br>
&gt;=C2=A0 =C2=A0 =C2=A0remark in<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; github that we would need discovery was actual=
ly overkill: The whole<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; purpose of X86_CR4_RESERVED is to filter out f=
uture unknown bits. But<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; CR4.PKE is no longer unknown, and it is appare=
ntly safe to allow it to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; the root cell. IOW, that commit was fine (if i=
t had been submitted<br>
&gt;=C2=A0 =C2=A0 =C2=A0with<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; signed-off here).<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Jan<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt; -- <br>
&gt; You received this message because you are subscribed to the Google<br>
&gt; Groups &quot;Jailhouse&quot; group.<br>
&gt; To unsubscribe from this group and stop receiving emails from it, send=
<br>
&gt; an email to <a href=3D"mailto:jailhouse-dev%2Bunsubscribe@googlegroups=
.com" target=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:jailhouse-dev%2Bunsubscribe@googlegroups.=
com" target=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a>&gt;.<=
br>
&gt; To view this discussion on the web visit<br>
&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/CACkfA5tm2H=
-LeU0MnQWM0TZGOOoeSjuAY8FeRNRODQCceJr-8A%40mail.gmail.com" rel=3D"noreferre=
r" target=3D"_blank">https://groups.google.com/d/msgid/jailhouse-dev/CACkfA=
5tm2H-LeU0MnQWM0TZGOOoeSjuAY8FeRNRODQCceJr-8A%40mail.gmail.com</a><br>
&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/CACkfA5=
tm2H-LeU0MnQWM0TZGOOoeSjuAY8FeRNRODQCceJr-8A%40mail.gmail.com?utm_medium=3D=
email&amp;utm_source=3Dfooter" rel=3D"noreferrer" target=3D"_blank">https:/=
/groups.google.com/d/msgid/jailhouse-dev/CACkfA5tm2H-LeU0MnQWM0TZGOOoeSjuAY=
8FeRNRODQCceJr-8A%40mail.gmail.com?utm_medium=3Demail&amp;utm_source=3Dfoot=
er</a>&gt;.<br>
&gt; For more options, visit <a href=3D"https://groups.google.com/d/optout"=
 rel=3D"noreferrer" target=3D"_blank">https://groups.google.com/d/optout</a=
>.<br>
<br>
</blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CACkfA5t%3DYfZzQBoY2Ci7201e6uJwA-_3fy9p_DjBSQYhBNn=
BqQ%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CACkfA5t%3DYfZzQBoY2Ci7201e6uJwA-_3fy9p_D=
jBSQYhBNnBqQ%40mail.gmail.com</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--00000000000067ea65058969cd87--
