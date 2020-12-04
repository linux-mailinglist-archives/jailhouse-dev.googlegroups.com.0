Return-Path: <jailhouse-dev+bncBCJ2NIVKYUNBBOG2U37AKGQE65WAG7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33b.google.com (mail-ot1-x33b.google.com [IPv6:2607:f8b0:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 021B02CE67F
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Dec 2020 04:30:02 +0100 (CET)
Received: by mail-ot1-x33b.google.com with SMTP id q8sf2084123otk.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Dec 2020 19:30:01 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607052600; cv=pass;
        d=google.com; s=arc-20160816;
        b=HkSEDkG+rZRxzKaPhbO9cutg7QP1o+ul6wf+FhWgXfU4sQH3iMQ9DIKRA31Wl8dO/N
         Qq297Aykm9jZjr4pUV2ILxy/SZ7sALo1ch1bgU4yWCXjDjQ+2zZ+R524LrEH8nJnjVFu
         DzYgH1HrB/X3NacK9dUzuSPVWyVRBkBwMFcGKxnDtuIhmO2/xgApEbb83pDCdVvnBKp5
         4qtkdJNqJBsd81NYNCGOrkyHNWhRzxYR5N+KtG9DCbbPToUWaNt3FM+FjmGGeRd7qdYQ
         E7hniq44GCO2/Ug3QjIwtQOSFkdgieK14om10P00hnoW7h1yEo+ADarHPLO9M8OlLo0c
         lCfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=2SBxUHv+KmBDCuTvDmKPqDKhxpipxFJTCw/+hkmE0lE=;
        b=et7WBFpFKXOMsqiMTF17rgCGxD91/+U/xhvnuCMEjAfQtgglo2dxkYyL3vFacvw9vp
         sjLMlW/8sIhp4uuJXvob3wlID+sRf/HK8NLMjxiZvQdWL7f1JW1UWAfIzz4ecSsM9JoO
         G9FFrx/3YTLgBemkp6/machrjFX9ckNhdP7EFEBil7AwiMKcHhoD/Ie+jJhiQY0CLMA7
         RUPCdd/26xeTpy+QVy6NxXhC/rldua4/J+pmOEhFXig84PBdJNeccmLmWaENuAmpPSaW
         648gZHq0URzwoqU7dxJmqg+30ypDbbPMwyjuaQICMoowf/hrMx8jFv7KYq2uUYDEGTRU
         ob0w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=g1zf1TPy;
       spf=pass (google.com: domain of peter.panjf@gmail.com designates 2607:f8b0:4864:20::1031 as permitted sender) smtp.mailfrom=peter.panjf@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2SBxUHv+KmBDCuTvDmKPqDKhxpipxFJTCw/+hkmE0lE=;
        b=nUJsjTJb7r91kdcYmLVpS4prMs3kUHHDhsYaFjFFj21DLM0HNXoUqoSShyLBBUdc2o
         FBYizJbtr2w8oR+lhA+s0GHuFeVDa/DmbHhSGSn4nlGxeTyt6tCh8a1lqElKnFin8sy7
         GN+ADCxYmWtwGwcdjTYA/ivYu9dHcN5n6VsfBcb5F7jsGZa2wFyOrtcEj64nQ2yJsTOy
         kb5nznw90ThOa/S7F+sJaPU+X9CWGKkW/4rfRBVSz4lTJNKuCTcfEcr4Kb0w7k+gLEiD
         M6ebdGvgJw+GQ2PXp5cZ28fAujkWZlsRJJ1DFcCf6YkPKZX3PsZrHDOn08mm/XiFZcqE
         ZSsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2SBxUHv+KmBDCuTvDmKPqDKhxpipxFJTCw/+hkmE0lE=;
        b=KP88K7vY1D44YLc7oLfh0Wi59cNzXGvpUCY0lCZ7DylRWFFBpn4BUTe5cymOlO1s2P
         8RIzn9ui+abLlbfZKUhvD8hFRBcl2m7isJJoHKjAGqZmtaghx+b1BkOSQDdf1q7mYi0N
         Q70eqZboK5e4K6H5ORVzrFIOaa8iseFjIrMSRb66oPsHfXZqntEQpZaJb3Z4iRGaAlKX
         itTbdyIWSexaw8vnHWJq1cYtSzwliSj2QAXy+FdMqf+9j6yR0Y21Plk6dqI+PRyLQDSo
         2h6r/WOmRFsncJaDnhAMx3MT+DHU5BdGL5Uf+zQ6eHFtYj0Zd4UEr0f01t7UxRf+ws+g
         MR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2SBxUHv+KmBDCuTvDmKPqDKhxpipxFJTCw/+hkmE0lE=;
        b=pq34lTOy2wzYcyYTEMfmgHwJBwpw1JUp6qtypRXRnhDvq/4aMi+5WdS692bMqd+5RE
         modYYp66kpCeeMU5QUx84UZX+xg6qrezWRoQUuQkZHxJQj836rT8QZhS23fHTwBkMuxe
         JmU9SecmThTBO/mRSEA/FLHGRdgSjETlR4VJ9kW1wZQOhLWCDEAG1wAxbZSwSkJaCclz
         FLhOthod7RR59NpCzhsLPq305K3UIikZSrkeZfa239BV9Q2PmWcRIEeMV8w78OikmiBV
         oRyt24OMVCZwCqxlyR7nLUY8o8daJq40xDV5Vlk1Z3hXaF+Mnf2XaedcIiE3S0s/JxvP
         q5FA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532V+O6BjOdlIQhtZyBWvU6nfMfRTTfKbnHUUOGRxNGAf9W9lwU8
	TClkTasS2Xcd6maVilWd2ok=
X-Google-Smtp-Source: ABdhPJwpcpRuDmEAuMyFEFUZeqo5Pt3hiY9bBdf1adoGciaPUCQwlEB34dOgZbSaj4RR+9dyWqHsdQ==
X-Received: by 2002:a4a:d495:: with SMTP id o21mr1967695oos.12.1607052600769;
        Thu, 03 Dec 2020 19:30:00 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:5e07:: with SMTP id d7ls1987908oti.9.gmail; Thu, 03 Dec
 2020 19:30:00 -0800 (PST)
X-Received: by 2002:a05:6830:1286:: with SMTP id z6mr2086786otp.334.1607052600201;
        Thu, 03 Dec 2020 19:30:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607052600; cv=none;
        d=google.com; s=arc-20160816;
        b=JJwleVWMfLMShIOM3ZwB15inBCrucrbRaZQxP+mwsTK+PrMoVr9LaRuU0mG9nrGJDW
         CjLfE0BS/BC3GFm87rixN004Bv79IB1+IdboAYOVyLdViFfl0Air0Ox+coqt9KxdsMVi
         7/n0gqkwsEaYnu6O9059zEfJqlHOoCrmodR9/Zu1Ec7k2z637ebQCHkvjEBP1AhVW1Vl
         uYGZs1qX6XbyZz6T65fJ6vt5MkIwdPpmASUU7l3pH6/CpOSbnH3CKyZ3Kbh9SCc+BlUO
         tRA0zJ9P9fQyDXGhKJ8AZqA3UaqVUh20glO16qVIotSLHriGqBMuYax2q52vpWtOF+rr
         OnpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PRdAYY6kW9L49chJW0FNm48aNl4s5Bu5qgK43ns7BB8=;
        b=HzzbdS4bSHLvWOrJYWrrwKlmLVBQXGGzNtSw5IxiUWYrSrtq/WqaUgkLFUNLH9LEO1
         HomQyPO8Wa/H7PZ02CElK2+SvDSXhF9FKtQVIrI/izVoGKSOoG5IvpewfbuLT9nQbjbD
         /8VVSaMb/KiKZi/0uZhyexhUoSxvlfT3HzpuqefYp8wrc33IytWzBaN4G12lBeAjz292
         g1a6U1idd8qB0jRoli7yj51lwX7FDVdyeHs7lxzCT56EI8iAkelUApEQBteWihkdkUuR
         eyNAQxJb8TaC5q4tUsnLGGhh0ib4ATWjObTFS9Mo5A2MT6zH6GnKmHXdlFkq81i+OnaZ
         WzEw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=g1zf1TPy;
       spf=pass (google.com: domain of peter.panjf@gmail.com designates 2607:f8b0:4864:20::1031 as permitted sender) smtp.mailfrom=peter.panjf@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com. [2607:f8b0:4864:20::1031])
        by gmr-mx.google.com with ESMTPS id u25si103186oic.0.2020.12.03.19.30.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Dec 2020 19:30:00 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.panjf@gmail.com designates 2607:f8b0:4864:20::1031 as permitted sender) client-ip=2607:f8b0:4864:20::1031;
Received: by mail-pj1-x1031.google.com with SMTP id iq13so2285343pjb.3
        for <jailhouse-dev@googlegroups.com>; Thu, 03 Dec 2020 19:30:00 -0800 (PST)
X-Received: by 2002:a17:902:9a4c:b029:d6:1f21:8021 with SMTP id
 x12-20020a1709029a4cb02900d61f218021mr2003787plv.58.1607052599652; Thu, 03
 Dec 2020 19:29:59 -0800 (PST)
MIME-Version: 1.0
References: <20201202020918.27120-1-Jiafei.Pan@nxp.com> <f9072054-c4bb-a4b3-a186-5b82a2b48b07@siemens.com>
In-Reply-To: <f9072054-c4bb-a4b3-a186-5b82a2b48b07@siemens.com>
From: Peter pan <peter.panjf@gmail.com>
Date: Fri, 4 Dec 2020 11:29:48 +0800
Message-ID: <CAJSojbZ9azXg14vEvZkUFthLumMf1tTnF4wkWr-Z58U8XxF+jg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] configs: ls1046a-rdb: add cell configure files
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jiafei Pan <Jiafei.Pan@nxp.com>, jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="00000000000056752205b59b17cc"
X-Original-Sender: peter.panjf@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=g1zf1TPy;       spf=pass
 (google.com: domain of peter.panjf@gmail.com designates 2607:f8b0:4864:20::1031
 as permitted sender) smtp.mailfrom=peter.panjf@gmail.com;       dmarc=pass
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

--00000000000056752205b59b17cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jan Kiszka <jan.kiszka@siemens.com> =E4=BA=8E2020=E5=B9=B412=E6=9C=883=E6=
=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=882:39=E5=86=99=E9=81=93=EF=BC=9A

> On 02.12.20 03:09, Jiafei Pan wrote:
> > Add root cell, inmate cell, ivshmem demo cell and Linux demo cell
> > configure files for NXP ls1046a RDB platform.
> >
> > Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
> > ---
> > Change in v2:
> >       - Removed some annotated code
> >
> >  configs/arm64/ls1046a-rdb-inmate-demo.c  |  67 +++
> >  configs/arm64/ls1046a-rdb-ivshmem-demo.c | 139 ++++++
>
> Only realized now: Why separate inmate vs. ivshmem demo configs? Other
> targets have them merged.
>
> Jan
>
> Yes, ivshmem demo includes inmate demo configs, will merge them together,
thanks.

Best Regards,
Jiafei.

> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/f9072054-c4bb-a4b3-a186-5=
b82a2b48b07%40siemens.com
> .
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAJSojbZ9azXg14vEvZkUFthLumMf1tTnF4wkWr-Z58U8XxF%2Bjg%40mail.=
gmail.com.

--00000000000056752205b59b17cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Jan Kiszka &lt;<a href=3D"mailto:jan.=
kiszka@siemens.com">jan.kiszka@siemens.com</a>&gt; =E4=BA=8E2020=E5=B9=B412=
=E6=9C=883=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=882:39=E5=86=99=E9=81=
=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
02.12.20 03:09, Jiafei Pan wrote:<br>
&gt; Add root cell, inmate cell, ivshmem demo cell and Linux demo cell<br>
&gt; configure files for NXP ls1046a RDB platform.<br>
&gt; <br>
&gt; Signed-off-by: Jiafei Pan &lt;<a href=3D"mailto:Jiafei.Pan@nxp.com" ta=
rget=3D"_blank">Jiafei.Pan@nxp.com</a>&gt;<br>
&gt; ---<br>
&gt; Change in v2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- Removed some annotated code<br>
&gt; <br>
&gt;=C2=A0 configs/arm64/ls1046a-rdb-inmate-demo.c=C2=A0 |=C2=A0 67 +++<br>
&gt;=C2=A0 configs/arm64/ls1046a-rdb-ivshmem-demo.c | 139 ++++++<br>
<br>
Only realized now: Why separate inmate vs. ivshmem demo configs? Other<br>
targets have them merged.<br>
<br>
Jan<br>
<br></blockquote><div>Yes, ivshmem demo includes inmate demo configs, will =
merge them together, thanks.</div><div><br></div><div>Best Regards,</div><d=
iv>Jiafei.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
Siemens AG, T RDA IOT<br>
Corporate Competence Center Embedded Linux<br>
<br>
-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com" tar=
get=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/f9072054-c4bb-a4b3-a186-5b82a2b48b07%40siemens.com=
" rel=3D"noreferrer" target=3D"_blank">https://groups.google.com/d/msgid/ja=
ilhouse-dev/f9072054-c4bb-a4b3-a186-5b82a2b48b07%40siemens.com</a>.<br>
</blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAJSojbZ9azXg14vEvZkUFthLumMf1tTnF4wkWr-Z58U8XxF%2=
Bjg%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAJSojbZ9azXg14vEvZkUFthLumMf1tTnF4wkWr-Z=
58U8XxF%2Bjg%40mail.gmail.com</a>.<br />

--00000000000056752205b59b17cc--
